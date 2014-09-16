## figshareData.R

## DUKE TRANSLATIONAL BIOINFORMATICS
## https://github.com/orgs/Duke-Translational-Bioinformatics/

## Figshare is a public resource provided by Digital Science
## a subsidiary of MacMillan Publishing (Nature's parent group)
## Per Figshare, they help you "manage your research in the cloud 
## and control who you share it with or make it publicly available 
## and citable

## Figshare has a public REST API that can be accessed directly
## via 'curl' commands or via clients such as the 'rfigshare'
## client provided by ROpenSci.

## 'rfigshare' can be directly installed from its public Github
## repository by using the 'devtools' R package.

## INSTALL PACKAGES
install.packages('devtools')
require(devtools)
# use the devtools 'install_git' function to install the package
install_git('git@github.com:ropensci/rfigshare.git')

## START USING FIGSHARE
require(rfigshare)
figAuth <- fs_auth() 

# the package will now open a browser window
