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
library(ggplot2)
library(janitor)

# Load Data

data_2015 <- read.csv("~/Desktop/telling_stories/inputs/data/data_2015.csv")
data_2016 <- read.csv("~/Desktop/telling_stories/inputs/data/data_2016.csv")
data_2017 <- read.csv("~/Desktop/telling_stories/inputs/data/data_2017.csv")
data_2018 <- read.csv("~/Desktop/telling_stories/inputs/data/data_2018.csv")

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

### Cleaning 2015 data ----
colnames(data_2015) <- my_column_names

# Clean using janitor and dplyr
data_2015 <- clean_names(data_2015)

data_2015 <- data_2015 %>% select(operation_name, operation_type, 
                                  city, electricity_quantity, ghg_emissions_kg)


data_2015 <- data_2015 %>% drop_na()

# Add year column
data_2015 <- data_2015 %>%
  mutate(year = "2015")

# Clean operation_type names
data_2015$operation_type[data_2015$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
data_2015$operation_type[data_2015$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
data_2015$operation_type[data_2015$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
data_2015$operation_type[data_2015$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2015$operation_type[data_2015$operation_type=="Storage facilities where equipment or vehicles are maintained, repaired or stored"] <- "Storage"
data_2015$operation_type[data_2015$operation_type=="Police stations and associated offices and facilities"] <- "Police Station"
data_2015$operation_type[data_2015$operation_type=="Administrative offices and related facilities, including municipal council chambers"] <- "Administrative Offices"
data_2015$operation_type[data_2015$operation_type=="Ambulance stations and associated offices and facilities"] <- "Ambulance Station"
data_2015$operation_type[data_2015$operation_type=="Fire stations and associated offices and facilities"] <- "Police Station"

# Convert chr to num
data_2015$electricity_quantity = as.numeric(data_2015$electricity_quantity)
data_2015$ghg_emissions_kg = as.numeric(data_2015$ghg_emissions_kg)

data_2015 <- data_2015[-1,]

### Cleaning 2016 data ----
colnames(data_2016) <- my_column_names

# Clean using janitor and dplyr
data_2016 <- clean_names(data_2016)

data_2016 <- data_2016 %>% select(operation_name, operation_type, 
                                  city, electricity_quantity, ghg_emissions_kg)


data_2016 <- data_2016 %>% drop_na()

# Clean operation_type names
data_2016$operation_type[data_2016$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
data_2016$operation_type[data_2016$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
data_2016$operation_type[data_2016$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
data_2016$operation_type[data_2016$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2016$operation_type[data_2016$operation_type=="Storage facilities where equipment or vehicles are maintained, repaired or stored"] <- "Storage"
data_2016$operation_type[data_2016$operation_type=="Police stations and associated offices and facilities"] <- "Police Station"
data_2016$operation_type[data_2016$operation_type=="Administrative offices and related facilities, including municipal council chambers"] <- "Administrative Offices"
data_2016$operation_type[data_2016$operation_type=="Ambulance stations and associated offices and facilities"] <- "Ambulance Station"
data_2016$operation_type[data_2016$operation_type=="Fire stations and associated offices and facilities"] <- "Police Station"

# Convert chr to num
data_2016$electricity_quantity = as.numeric(data_2016$electricity_quantity)
data_2016$ghg_emissions_kg = as.numeric(data_2016$ghg_emissions_kg)

data_2016 <- data_2016[-1,]

# Add year column
data_2016 <- data_2016 %>%
  mutate(year = "2016")

### Cleaning 2017 data ----
colnames(data_2017) <- my_column_names

# Clean using janitor and dplyr
data_2017 <- clean_names(data_2017)

data_2017 <- data_2017 %>% select(operation_name, operation_type, 
                                  city, electricity_quantity, ghg_emissions_kg)


data_2017 <- data_2017 %>% drop_na()

# Clean operation_type names
data_2017$operation_type[data_2017$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
data_2017$operation_type[data_2017$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
data_2017$operation_type[data_2017$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
data_2017$operation_type[data_2017$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2017$operation_type[data_2017$operation_type=="Storage facilities where equipment or vehicles are maintained, repaired or stored"] <- "Storage"
data_2017$operation_type[data_2017$operation_type=="Police stations and associated offices and facilities"] <- "Police Station"
data_2017$operation_type[data_2017$operation_type=="Administrative offices and related facilities, including municipal council chambers"] <- "Administrative Offices"
data_2017$operation_type[data_2017$operation_type=="Ambulance stations and associated offices and facilities"] <- "Ambulance Station"
data_2017$operation_type[data_2017$operation_type=="Fire stations and associated offices and facilities"] <- "Police Station"

# Convert chr to num
data_2017$electricity_quantity = as.numeric(data_2017$electricity_quantity)
data_2017$ghg_emissions_kg = as.numeric(data_2017$ghg_emissions_kg)

data_2017 <- data_2017[-1,]

# Add year column
data_2017 <- data_2017 %>%
  mutate(year = "2017")

# Cleaning 2018 data
colnames(data_2018) <- my_column_names

# Clean using janitor and dplyr
data_2018 <- clean_names(data_2018)

data_2018 <- data_2018 %>% select(operation_name, operation_type, 
                                  city, electricity_quantity, ghg_emissions_kg)


data_2018 <- data_2018 %>% drop_na()

# Clean operation_type names
data_2018$operation_type[data_2018$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
data_2018$operation_type[data_2018$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
data_2018$operation_type[data_2018$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
data_2018$operation_type[data_2018$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2018$operation_type[data_2018$operation_type=="Storage facilities where equipment or vehicles are maintained, repaired or stored"] <- "Storage"
data_2018$operation_type[data_2018$operation_type=="Police stations and associated offices and facilities"] <- "Police Station"
data_2018$operation_type[data_2018$operation_type=="Administrative offices and related facilities, including municipal council chambers"] <- "Administrative Offices"
data_2018$operation_type[data_2018$operation_type=="Ambulance stations and associated offices and facilities"] <- "Ambulance Station"
data_2018$operation_type[data_2018$operation_type=="Fire stations and associated offices and facilities"] <- "Police Station"

# Convert chr to num
data_2018$electricity_quantity = as.numeric(data_2018$electricity_quantity)
data_2018$ghg_emissions_kg = as.numeric(data_2018$ghg_emissions_kg)

data_2018 <- data_2018[-1,]

# Add year column
data_2018 <- data_2018 %>%
  mutate(year = "2018")

### Combine 2015-2018 data ----
energy_2015_2018 <- rbind(data_2015, data_2016, data_2017, data_2018)

# Import clean 2015 to 2018 data
write_csv(
  x = energy_2015_2018,
  file = "~/Desktop/telling_stories/inputs/data/energy_data_2015_2018.csv"
)
