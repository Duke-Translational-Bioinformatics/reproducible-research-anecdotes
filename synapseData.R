## synapseData.R

## DUKE TRANSLATIONAL BIOINFORMATICS
## https://github.com/orgs/Duke-Translational-Bioinformatics/

## Synapse is a public resource provided by Sage Bionetworks.
## Though Synapse shares many features with Figshare, its focus
## is more on analysis first and publishing second. A key
## distinction is access privileges are focused on Projects
## and a Project does not have to be public for the API to 
## be used to push data up and down.

## Synapse has a public REST API that can be accessed directly
## via 'curl' commands or via clients such as the 'rSynapseClient'
## client provided by Sage Bionetworks

## 'rSynapseClient' can be directly installed from a Sage Bionetworks
## server or via Github

## GO TO THE WEBSITE AND REGISTER AN ACCOUNT
# point your browser to http://synapse.org
# click on 'Register' in the upper right corner
# enter your email and click the 'Register' button
# an email will be sent to your account
# click on the link in the email
# fill out the registration info and click 'Register'


## INSTALL THE R SYNAPSE CLIENT
# Method 1: via Sage Bionetworks
source("http://depot.sagebase.org/CRAN.R")
pkgInstall("synapseClient")

# Method 2: via Github
require(devtools)
install_git('git@github.com:Sage-Bionetworks/rSynapseClient.git')

## GOOD PRACTICES IN SCIENTIFIC SCRIPTING
# don't hardcode user authentication info or tokens in your code
# store this, if possible in your .Rprofile in your home directory
# see 'example.Rprofile' and cut and paste that into your current
# .Rprofile, or just change its name to .Rprofile and copy it into 
# your home directory