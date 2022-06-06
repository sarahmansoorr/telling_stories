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

data_2015 <- read.csv("telling_stories/inputs/data/energy_consumption_2015.csv")
data_2016 <- read.csv("telling_stories/inputs/data/energy_consumption_2016.csv")
data_2017 <- read.csv("telling_stories/inputs/data/energy_consumption_2017.csv")
data_2018 <- read.csv("telling_stories/inputs/data/energy_consumption_2018.csv")

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

### Cleaning 2015 data ###
colnames(data_2015) <- my_column_names

# Remove first 7 rows
# ...

# Clean using janitor and dplyr
data_2015 <- clean_names(data_2015)
data_2015 <- remove_empty(data_2015, which = c("rows", "cols"),
                           quiet = FALSE)
data_2015 <- distinct(data_2015)

data_2015 <- data_2015 %>% select(operation_name, operation_type, 
                                   city, total_floor_area, avg_hrs_wk, 
                                   annual_flow_mega_liters, electricity_quantity, 
                                   natural_gas_quantity, ghg_emissions_kg, 
                                   energy_intensity_ek_wh_sqft,
                                   energy_intensity_ek_wh_mega_litre)
data_2015 <- data_2015 %>% drop_na()

# Clean operation_type names
df <- data_2015
df$operation_type[df$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
df$operation_type[df$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
df$operation_type[df$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
df$operation_type[df$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2015 <- df

# Convert chr to num
data_2015$total_floor_area = as.numeric(data_2015$total_floor_area)
data_2015$avg_hrs_wk = as.numeric(data_2015$avg_hrs_wk)
data_2015$annual_flow_mega_liters = as.numeric(data_2015$annual_flow_mega_liters)
data_2015$electricity_quantity = as.numeric(data_2015$electricity_quantity)
data_2015$natural_gas_quantity = as.numeric(data_2015$natural_gas_quantity)
data_2015$ghg_emissions_kg = as.numeric(data_2015$ghg_emissions_kg)
data_2015$energy_intensity_ek_wh_sqft = as.numeric(data_2015$energy_intensity_ek_wh_sqft)
data_2015$energy_intensity_ek_wh_mega_litre = as.numeric(data_2015$energy_intensity_ek_wh_mega_litre)

# Cleaning 2016 data
colnames(data_2016) <- my_column_names

# Remove first 7 rows
# ...

# Clean using janitor and dplyr
data_2016 <- clean_names(data_2016)
data_2016 <- remove_empty(data_2016, which = c("rows", "cols"),
                          quiet = FALSE)
data_2016 <- distinct(data_2016)

data_2016 <- data_2016 %>% select(operation_name, operation_type, 
                                  city, total_floor_area, avg_hrs_wk, 
                                  annual_flow_mega_liters, electricity_quantity, 
                                  natural_gas_quantity, ghg_emissions_kg, 
                                  energy_intensity_ek_wh_sqft,
                                  energy_intensity_ek_wh_mega_litre)
data_2016 <- data_2016 %>% drop_na()

# Clean operation_type names
df <- data_2016
df$operation_type[df$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
df$operation_type[df$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
df$operation_type[df$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
df$operation_type[df$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2016 <- df

# Convert chr to num
data_2016$total_floor_area = as.numeric(data_2016$total_floor_area)
data_2016$avg_hrs_wk = as.numeric(data_2016$avg_hrs_wk)
data_2016$annual_flow_mega_liters = as.numeric(data_2016$annual_flow_mega_liters)
data_2016$electricity_quantity = as.numeric(data_2016$electricity_quantity)
data_2016$natural_gas_quantity = as.numeric(data_2016$natural_gas_quantity)
data_2016$ghg_emissions_kg = as.numeric(data_2016$ghg_emissions_kg)
data_2016$energy_intensity_ek_wh_sqft = as.numeric(data_2016$energy_intensity_ek_wh_sqft)
data_2016$energy_intensity_ek_wh_mega_litre = as.numeric(data_2016$energy_intensity_ek_wh_mega_litre)



# Cleaning 2017 data
colnames(data_2017) <- my_column_names

# Remove first 7 rows
# ...

# Clean using janitor and dplyr
data_2017 <- clean_names(data_2017)
data_2017 <- remove_empty(data_2017, which = c("rows", "cols"),
                          quiet = FALSE)
data_2017 <- distinct(data_2017)

data_2017 <- data_2017 %>% select(operation_name, operation_type, 
                                  city, total_floor_area, avg_hrs_wk, 
                                  annual_flow_mega_liters, electricity_quantity, 
                                  natural_gas_quantity, ghg_emissions_kg, 
                                  energy_intensity_ek_wh_sqft,
                                  energy_intensity_ek_wh_mega_litre)
data_2017 <- data_2017 %>% drop_na()

# Clean operation_type names
df <- data_2017
df$operation_type[df$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
df$operation_type[df$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
df$operation_type[df$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
df$operation_type[df$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2017 <- df

# Convert chr to num
data_2017$total_floor_area = as.numeric(data_2017$total_floor_area)
data_2017$avg_hrs_wk = as.numeric(data_2017$avg_hrs_wk)
data_2017$annual_flow_mega_liters = as.numeric(data_2017$annual_flow_mega_liters)
data_2017$electricity_quantity = as.numeric(data_2017$electricity_quantity)
data_2017$natural_gas_quantity = as.numeric(data_2017$natural_gas_quantity)
data_2017$ghg_emissions_kg = as.numeric(data_2017$ghg_emissions_kg)
data_2017$energy_intensity_ek_wh_sqft = as.numeric(data_2017$energy_intensity_ek_wh_sqft)
data_2017$energy_intensity_ek_wh_mega_litre = as.numeric(data_2017$energy_intensity_ek_wh_mega_litre)


# Cleaning 2018 data
colnames(data_2018) <- my_column_names

# Remove first 7 rows
# ...

# Clean using janitor and dplyr
data_2018 <- clean_names(data_2018)
data_2018 <- remove_empty(data_2018, which = c("rows", "cols"),
                          quiet = FALSE)
data_2018 <- distinct(data_2018)

data_2018 <- data_2018 %>% select(operation_name, operation_type, 
                                  city, total_floor_area, avg_hrs_wk, 
                                  annual_flow_mega_liters, electricity_quantity, 
                                  natural_gas_quantity, ghg_emissions_kg, 
                                  energy_intensity_ek_wh_sqft,
                                  energy_intensity_ek_wh_mega_litre)
data_2018 <- data_2018 %>% drop_na()

# Clean operation_type names
df <- data_2018
df$operation_type[df$operation_type=="Facilities related to the pumping of sewage"] <- "Sewage Pumping"
df$operation_type[df$operation_type=="Facilities related to the pumping of water"] <- "Water Pumping"
df$operation_type[df$operation_type=="Facilities related to the treatment of water"] <- "Water Treatment"
df$operation_type[df$operation_type=="Facilities related to the treatment of sewage"] <- "Sewage Treatment"
data_2018 <- df

# Convert chr to num
data_2018$total_floor_area = as.numeric(data_2018$total_floor_area)
data_2018$avg_hrs_wk = as.numeric(data_2018$avg_hrs_wk)
data_2018$annual_flow_mega_liters = as.numeric(data_2018$annual_flow_mega_liters)
data_2018$electricity_quantity = as.numeric(data_2018$electricity_quantity)
data_2018$natural_gas_quantity = as.numeric(data_2018$natural_gas_quantity)
data_2018$ghg_emissions_kg = as.numeric(data_2018$ghg_emissions_kg)
data_2018$energy_intensity_ek_wh_sqft = as.numeric(data_2018$energy_intensity_ek_wh_sqft)
data_2018$energy_intensity_ek_wh_mega_litre = as.numeric(data_2018$energy_intensity_ek_wh_mega_litre)



# Import clean 2015 data
write_csv(
  x = data_2015,
  file = "telling_stories/inputs/data/energy_consumption_2015.csv"
)

# Import clean 2016 data
write_csv(
  x = data_2016,
  file = "telling_stories/inputs/data/energy_consumption_2016.csv"
)

# Import clean 2017 data
write_csv(
  x = data_2017,
  file = "telling_stories/inputs/data/energy_consumption_2017.csv"
)

# Import clean 2018 data
write_csv(
  x = data_2018,
  file = "telling_stories/inputs/data/energy_consumption_2018.csv"
)
