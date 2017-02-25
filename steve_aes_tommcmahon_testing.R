# Syntax to read in Tom McMahon's data and read it to adadataverse

#library(haven)
#aes_2016 <- load("https://github.com/thmcmahon/aes/blob/master/data/aes_2016.rda?raw=true")

# Install the aes package and read the 2016 data
devtools::install_github("thmcmahon/aes")
library(aes)
data(aes_2016)

# check the data and metadata
?aes_2016

# Get a list of the factors for A1 (i.e. the categorical values)
levels(aes_2016$A1)
summary(aes_2016$A1)

# repeat above for AES2007
data(aes_2007)
levels(aes_2007$a1)
summary(aes_2007$a1)
?aes_2007

# convert to tibbles
library(tibble)
as_tibble(aes_2016)