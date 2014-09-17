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
                         type = 'dataset')

# if you're properly authenticated, you'll get a return that states
# that your 'article' has been created and it's ID number.

## UPLOAD DATA TO FIGSHARE USING ITS API
# for demo purposes let's just use the famous Iris dataset that 
# comes with every R installation.
data(iris)

# convert to a .CSV file
write.csv(iris, 'iris.csv')

# send up to Figshare cloud
uploadReturn <- fs_upload(myProjectID, 'iris.csv')

## INSPECT METADATA ABOUT THE ARTICLE
articleDetail <- fs_details(myProjectID)

# output should look something like the below:
show(articleDetail)
# article_id: 1172279.0
# title: iris.csv
# master_publisher_id: 0.0e+00
# defined_type: fileset
# status: Drafts
# version: 1.0
# published_date: 11:57, Sep 16, 2014
# description: A test project for learning about Figshare
# description_nohtml: A test project for learning about Figshare
# total_size: 4.60 KB
# authors:
#   - first_name: Erich
# last_name: Huang
# id: 629551.0
# full_name: Erich Huang
# tags:
#   - id: 195392.0
# name: Published using rfigshare
# categories: []
# files:
#   - size: 5 KB
# thumb: ~
#   id: 1679019.0
# mime_type: text/plain
# name: iris.csv
# links: []

## DEAL WITH IDIOSYNCRACY
# when you upload a file to a Figshare article, the filename replaces the title
updateReturn <- fs_update(myProjectID, title = 'New Title')

# if you want to publish a Figshare article, all metadata fields have to be populated
categoryReturn <- fs_add_categories(myProjectID, c('Botany', 'Information Systems'))

## MAKE THE DATASET PUBLIC
statusReturn <- fs_make_public(articleDetail$article_id)

## PULL DOWN THE SAME ARTICLE
# note: arguable whether this is a feature or a bug, that a dataset must be public in
# order for it to be downloadable.
fs_download(articleDetail$article_id, urls_only = FALSE)
