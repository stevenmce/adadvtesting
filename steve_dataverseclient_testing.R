## Script to install "dataverse" pacakage from Thomas Leeper 

# install ghit - to allow installation of giithub based packages
if(!require("ghit")) {
  install.packages("ghit")
}

library("ghit")

# can also use devtools
#instead of ghit

install.packages("devtools")
library("devtools")

# install the dataverse client from Github
#ghit::install_github("IQSS/dataverse-client-r")
install_github("IQSS/dataverse-client-r")

# use the dataverse package
library("dataverse")

# ADA - set the dataverse you want to use
Sys.setenv("DATAVERSE_SERVER" = "adadataverse.org")

# set your API key (if you want to use this)
Sys.setenv("DATAVERSE_KEY" = "examplekey12345")
#Steve
# CHANGE AT END OF SESSION
#Sys.setenv("DATAVERSE_KEY" = "INSERTKEYHERE")

# HARVARD - set the dataverse you want to use
Sys.setenv("DATAVERSE_SERVER" = "demo.dataverse.org")

# set your API key (if you want to use this)
Sys.setenv("DATAVERSE_KEY" = "examplekey12345")
#Steve
# CHANGE AT END OF SESSION
Sys.setenv("DATAVERSE_KEY" = "INSERTKEYHERE")


# get a list of datasets from the ADA dataverse
library("dataverse")

adadataverse <- get_dataverse("ADA Dataverse")

adadataverse_data <- dataverse_contents(adadataverse)

# Get dataset and file info 
d1 <- get_dataset(adadataverse_data[[1]])
f <- get_file(d1$files$dataFile$id[1])
f2 <- get_file(d1$files$dataFile$id[2])
d1
f2

df1 <- dataset_files(adadataverse_data[[1]], version = ":latest",
                     key = Sys.getenv("DATAVERSE_KEY"),
                     server = Sys.getenv("DATAVERSE_SERVER")
)

# search only for datasets
dataverse_search(author = "McEachern, Steven", type = "dataset")
dataverse_search(author = "McAllister, Ian", type = "dataset")

dataverse_search(title = "Building")

# Get the root dataverse
adadvroot <- get_dataverse(":root")

# Get dataverse facets
dvfacets <- get_facets(adadataverse, key = Sys.getenv("DATAVERSE_KEY"),
           server = Sys.getenv("DATAVERSE_SERVER"))

# Dataset versions:
# This doesn't work
dv1 <- dataset_versions(adadataverse_data[[4]])

# This does work:
dsf <- dataset_files(adadataverse_data[[1]])

# ABOVE HERE - tested and working
# BELOW HERE - functions do not work - need to investigate

# create a list of metadata
metadat <- list(title = "My Study",
                creator = "Doe, John",
                description = "An example study")

# create the dataset
dat <- create_dataset("adadataverse", body = metadat)
# Harvard demo
dataverse_metadata("stevenmceachern", key = Sys.getenv("DATAVERSE_KEY"),
                   server = Sys.getenv("DATAVERSE_SERVER"))
dat <- create_dataset("stevenmceachern", body = metadat)


# Get a dataverse file
path <- get_file("aes_1987_00445.tab", "doi:10.5072/FK2/45OPL0")
library(foreign)
library(haven)
library(tibble)
aes1987 <- read.spss(get_file("aes_1987_00445.tab", "doi:10.5072/FK2/45OPL0"))
f

# Get the list of roles on the dataverse
r <- create_role(adadataverse, "exampleRole", "role name", "description here", key = Sys.getenv("DATAVERSE_KEY"),
                 server = Sys.getenv("DATAVERSE_SERVER"))

list_roles(adadataverse, key = Sys.getenv("DATAVERSE_KEY"),
                      server = Sys.getenv("DATAVERSE_SERVER"))

# Create a new dataset on the server

meta <- list()
ds <- create_dataset(adadataverse, body = meta, server = Sys.getenv("DATAVERSE_SERVER"), key = Sys.getenv("DATAVERSE_KEY"))

(adadataverse_data[[1]])

d <- service_document()
ds1 <- dataset_statement(d[[2]])

# Get the facets of adadataverse

get_facets(adadataverse$ncld, key = Sys.getenv("DATAVERSE_KEY"),
           server = Sys.getenv("DATAVERSE_SERVER"))

# create a group
g <- create_group("ADA Dataverse", "testgroup", "aGroupName", "this is a test group",  
                  key = Sys.getenv("DATAVERSE_KEY"),
                  server = Sys.getenv("DATAVERSE_SERVER")
)

# list all groups
dvgroups <- list_groups(adadataverse)


# create a dataset in the dataverse

metadatalist <- list()
steveds <- create_dataset("ADA Dataverse", body = metadatalist)

