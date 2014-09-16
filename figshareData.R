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

# the package will now open a browser window from which you can
# create a Figshare account and authenticate, the package will
# then create a local file to cache credentials.

## CREATE A FIGSHARE PROJECT
myProjectID <- fs_create(title = 'My Test Figshare Project', 
                         description = 'A test project for learning about Figshare', 
                         type = 'fileset')

# if you're properly authenticated, you'll get a retrun that states
# that your 'article' has been created and it's ID number.

## UPLOAD DATA TO FIGSHARE USING ITS API
# for demo purposes let's just use the famous Iris dataset that 
# comes with every R installation.
data(iris)

# convert to a .CSV file
write.csv(iris, 'iris.csv')

# send up to Figshare cloud
uploadReturn <- fs_update(myProjectID, 'iris.csv')

## PULL DOWN THE SAME ARTICLE
myArticle <- fs_download(myProjectID)
