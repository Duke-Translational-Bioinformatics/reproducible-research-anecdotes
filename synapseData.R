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
myProject <- synStore(Project(name = 'My Iris Test Project'))
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

## ANNOTATE A PROJECT
# you can access the annotations of a Project object either using the
# 'annotations()' method, or the '$' accessor.

# if you enter
annotations(myProject)

