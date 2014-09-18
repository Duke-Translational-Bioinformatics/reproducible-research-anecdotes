## synapseData.R

## DUKE TRANSLATIONAL BIOINFORMATICS
## https://github.com/orgs/Duke-Translational-Bioinformatics/

## Synapse is a public resource provided by Sage Bionetworks.
## Though Synapse shares many features with Figshare, its focus
## is more on analysis first and publishing second. A key
## distinction is access privileges are focused on Projects
## and a Project does not have to be public for the API to 
## be used to push data up and down (Figshare only allows
## downloading of public projects probably because of the way
## its HTTP endpoints are constructed).

## Synapse has a public REST API that can be accessed directly
## via 'curl' commands or via clients such as the 'Synapse Client'
##provided by Sage Bionetworks

## 'rSynapseClient' can be directly installed from a Sage Bionetworks
## server or via Github

## GO TO THE WEBSITE AND REGISTER AN ACCOUNT
# point your browser to http://synapse.org
# click on 'Register' in the upper right corner
# enter your email and click the 'Register' button
# an email will be sent to your account
# click on the link in the email
# fill out the registration info and click 'Register'

# NOTE that starting October 15th, the Western IRB requires
# that all Synapse users pass a short quiz to certify that
# they are familiar with Synapse policies regarding RCR.
# Once certified, users can upload data to Synapse after
# 15 October.


## INSTALL THE R SYNAPSE CLIENT
# Method 1: via Sage Bionetworks (choose one)
source("http://depot.sagebase.org/CRAN.R")
pkgInstall("synapseClient")

# Method 2: via Github
require(devtools)
install_git('git@github.com:Sage-Bionetworks/rSynapseClient.git')

## GOOD PRACTICES IN SCIENTIFIC SCRIPTING
# DON'T HARDCODE AUTHENTICATION INFO INTO YOUR SCRIPTS!
# store these private data, if possible in your .Rprofile in your 
# home directory see 'example.Rprofile' and cut and paste that 
# into your current .Rprofile, or just change its name to .Rprofile 
# and copy it into your home directory

require(synapseClient)

# if your .Rprofile correctly passed your credentials to Synapse
# you will now be authenticated

## CREATE A PROJECT
# let's use the API to create a Project
# note that Project names must be unique
myProject <- synStore(Project(name = 'My Iris Test Project 2'))
show(myProject)

# you'll see something like this:
# An object of class "Project"
# Synapse Entity Name : My Iris Test Project
# Synapse Entity Id   : syn2701191
# Parent Id     : syn4489
# 
# For complete list of annotations, please use the annotations() function.

# basically, you used the R client to access the web API and created a 'Project' 
# in the Synapse cloud (Amazon AWS)

# Just about everything in Synapse has a unique identifier 'syn#######', whether
# it's a Project, Folder, or Data. We use this identifier to reference all of 
# these Synapse 'Entities'

# You can always access an Entity's identifier using the '$' accessor under 
# 'properties'
myProject$properties$id
# will show:
# [1] "syn2701191"

# CREATE A FOLDER
# 'Projects' are containers that can enclose 'Folders', or 'Files'
# let's create a 'Data' folder in the 'My Iris Test Project' Project

# here, we use the 'Folder()' constructor to create it using the API
# one of the parameter is the 'parentId' of the Project we want the
# Folder to reside in
myFolder <- Folder(name = 'Data', parentId = myProject$properties$id)
myFolder <- synStore(myFolder)

# here's a cute method:
onWeb(myFolder)

# this will open your web browser (assuming you're authenticated) to
# the Entity in question.

## PUT DATA IN OUR FOLDER
# let's pull up the Fisher Iris dataset again
data(iris)

# write it to our filesystem as CSV, and as an R object
write.csv(iris, 'iris.csv')
saveRDS(iris, 'iris.rds')

# now use the 'File' constructors for both of these Files
csvFile <- File(path = 'iris.csv', parentId = myFolder$properties$id)
rdsFile <- File(path = 'iris.rds', parentId = myFolder$properties$id)

fileList <- list(csvFile, rdsFile)

fileReturn <- lapply(fileList, synStore)

# I got fancy above, I created an R list with each File object 
# and used the 'lapply' vector operation to send the Files up to Synapse
# in bulk

# alternatively, we could have done:
# csvFile <- synStore(csvFile) ; rdsFile <- synStore(rdsFile)

show(fileReturn)
# will yield something like this:
# [[1]]
# An object of class "File"
# Synapse Entity Name : iris.csv
# Synapse Entity Id   : syn2701196
# Parent Id     : syn2701195
# Version Number  : 1
# Version ID   : 
#   
#   For complete list of annotations, please use the annotations() function.
# 
# [[2]]
# An object of class "File"
# Synapse Entity Name : iris.rds
# Synapse Entity Id   : syn2701197
# Parent Id     : syn2701195
# Version Number  : 1
# Version ID   : 
#   
#   For complete list of annotations, please use the annotations() function.

# let's use the onWeb() function to show a file in the browser, accessing
# the list object
lapply(fileReturn, onWeb)

# this should open two tabs in the browser

## CREATING PROVENANCE
# instantiate an 'Activity'
generatedData <- Activity(name = 'Iris data collection',
                          description = 'An Iris data robot measured values')

# send the Activity up to Synapse
generatedData <- storeEntity(generatedData) 

# associate the Activity with Data to create Provenance
generatedBy(fileReturn[[1]]) <- generatedData
generatedBy(fileReturn[[2]]) <- generatedData

# use synStore again to declare the relationship in Synapse
fileReturn <- lapply(fileReturn, synStore)

## MORE COMPLEX PROVENANCE
# let's create a figure from these data
# install the fantastic 'ggplot2' package

# first, clear the workspace
rm(list = ls())

# install and source 'ggplot2'
install.packages('ggplot2')
require(ggplot2)

irisDataEntity <- synGet('syn2701266')
irisData <- readRDS(irisDataEntity@filePath)

irisPlot <- ggplot(irisData, aes(factor(Species), Petal.Width)) +
  geom_boxplot(aes(fill = factor(Species)), alpha = 0.3) +
  geom_jitter(aes(colour = factor(Species)), size = 3) +
  ggtitle('Boxplot of Iris Petal Width by Species\n')

show(irisPlot)

# Put this plot binary in Synapse
saveRDS(irisPlot, 'irisPlot.rds')

irisPlotFile <- File(path = 'irisPlot.rds', parentId = irisDataEntity$properties$parentId)

