#### Preamble ####
# Purpose: Clean the data downloaded from Toronto Open Data Portal
# Author: Sarah Mansoor
# Data: May 2022
# Contact: sarah.mansoor@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("0600cad8-d024-483b-a9a8-ecfc3e32e375")

#get package resources
resources <- package %>% list_package_resources()

# 2015 data
data_2015 <- resources[3,] %>% get_resource()

# 2016 data
data_2016 <- resources[4,] %>% get_resource()

# 2017 data
data_2017 <- resources[5,] %>% get_resource()

# 2018 data
data_2018 <- resources[6,] %>% get_resource()

# Import 2015 data
write_csv(
  x = data_2015,
  file = "~/Desktop/telling_stories/inputs/data/data_2015.csv"
)

# Import 2016 data
write_csv(
  x = data_2016,
  file = "~/Desktop/telling_stories/inputs/data/data_2016.csv"
)

# Import 7 data
write_csv(
  x = data_2017,
  file = "~/Desktop/telling_stories/inputs/data/data_2017.csv"
)

# Import 2018 data
write_csv(
  x = data_2018,
  file = "~/Desktop/telling_stories/inputs/data/data_2018.csv"
)
