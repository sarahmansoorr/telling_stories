#### Preamble ####
# Purpose: Download and clean data from opendatatoronto
# Author: Sarah Mansoor
# Date: May 2022
# Contact: sarah.mansoor@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data from opendatatoronto and saved it to inputs/data

#### Work space setup ####

library(tidyverse)
library(janitor)
library(dplyr)
library(tidyr)
library(ggplot2)
library(opendatatoronto)
library(knitr)
library(lubridate)
library(patchwork)

#### Read in the raw data. ####

## Download Data ###
# Data located at the following URL: 
# https://open.toronto.ca/dataset/annual-energy-consumption/

# get package
package <- get_resource("0600cad8-d024-483b-a9a8-ecfc3e32e375")
package

attach(cleaned_data_2015)
attach(cleaned_data_2016)
attach(cleaned_data_2017)
attach(cleaned_data_2018)

cleaned_data_2018 <- select(cleaned_data_2018, -X)

year <- c(2015, 2016, 2017, 2018)
a <- c(length(cleaned_data_2015$Operation.Name),
       length(cleaned_data_2016$Operation.Name), 
       length(cleaned_data_2017$Operation.Name), 
       length(cleaned_data_2018$Operation.Name))
Year <- rep(year, a)

energy_consumption <- rbind(cleaned_data_2015, cleaned_data_2016, 
                            cleaned_data_2017, cleaned_data_2018)
energy_consumption <- cbind(a = Year, energy.consumption)
names(energy_consumption)[1] <- 'Year'

energy_consumption <- na.omit(energy.consumption)

