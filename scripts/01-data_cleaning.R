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

# Cleaning data
my_column_names <- c("Operation Name", "Operation Type", "Address",
                     "City", "Postal Code", "Total Floor Area",
                     "Unit", "Avg hrs/wk", "Annual Flow (Mega Liters)",
                     "Electricity Quantity", "Electricity Unit",
                     "Natural Gas Quantity", "Natural Gas Unit", 
                     "Fuel Oil 1 & 2 Quantity", "Fuel Oil 1 & 2 Unit", 
                     "Fuel Oil 4 & 6 Quantity", "Fuel Oil 4 & 6 Unit",
                     "Propane Quantity", "Propoane Unit", "Coal Quantity",
                     "Coal Unit", "Wood Quantity", "Wood Unit", "District Heating Quantity",
                     "District Heating Unit", "District Hearing Renewable", "District Heating Emission Factor",
                     "District Cooling Quantity", "District Cooling Unit", "District Cooling Renewable",
                     "District Cooling Emission Factor", "GHG Emissions (kg)", "Energy Intensity (ekWh/sqft)",
                     "Energy Intensity (ekWh/Mega Litre", "Building/Operation Identifier", "Comments")

# Cleaning 2015 data
colnames(data_2015) <- my_column_names

# Cleaning 2016 data
colnames(data_2016) <- my_column_names

# Cleaning 2017 data
colnames(data_2017) <- my_column_names

# Cleaning 2018 data
colnames(data_2018) <- my_column_names
