# ggplots ----

# GHG emissions by year and operation type
energy_2015_2018 %>% ggplot(aes(x = year, y = ghg_emissions_kg, 
                                color = operation_type)) + geom_point()

energy_2015_2018 %>% filter(operation_type != "Sewage Treatment" ) %>% ggplot(
  aes(x = year, y = ghg_emissions_kg, color = operation_type)) + geom_point()

energy_2015_2018 %>% filter(operation_type != "Sewage Treatment" & 
                            operation_type != "Other") %>% ggplot(
  aes(x = year, y = ghg_emissions_kg, color = operation_type)) + geom_point()

energy_2015_2018 %>% filter(operation_type != "Sewage Treatment" & 
                              operation_type != "Other" & 
                              operation_type != "Administrative Offices" & 
                              operation_type != "Water Treatment") %>% ggplot(
    aes(x = year, y = ghg_emissions_kg, color = operation_type)) + geom_point()

energy_2015_2018 %>% filter(operation_type != "Sewage Treatment" & 
                              operation_type != "Other" & 
                              operation_type != "Administrative Offices" & 
                              operation_type != "Water Treatment" & 
                              operation_type != "Water Pumping") %>% ggplot(
     aes(x = year, y = ghg_emissions_kg, color = operation_type)) + geom_point()

energy_2015_2018 %>% filter(operation_type == "Sewage Treatment" | 
                              operation_type == "Water Treatment" | 
                              operation_type == "Water Pumping" | 
                              operation_type == "Administrative Offices") %>% ggplot(
  aes(x = year, y = ghg_emissions_kg, color = operation_type)) + geom_point()

# GHG emissions by year and city

energy_2015_2018 %>% ggplot(
  aes(x = year, y = ghg_emissions_kg, color = city)) + geom_point()

energy_2015_2018 %>% filter(operation_type != "Sewage Treatment") %>% ggplot(
  aes(x = year, y = ghg_emissions_kg, color = city)) + geom_point()

energy_2015_2018 %>% filter(operation_type != "Sewage Treatment" & 
                              city != "Toronto") %>% ggplot(
  aes(x = year, y = ghg_emissions_kg, color = city)) + geom_point()

energy_2015_2018 %>% filter(operation_type == "Sewage Treatment" & 
                              city == "Toronto") %>% ggplot(
    aes(x = year, y = ghg_emissions_kg, color = city)) + geom_point()


# tables ----

install.packages("kableExtra")
library(kableExtra)

energy_2015_2018 %>% select(operation_type, city, ghg_emissions_kg, year)  %>%
  slice(c(162, 393, 1310, 1318, 2610, 2650, 4100, 4150, 5560, 5566)) %>%
    kable(
      caption = "Extracting rows from the Annual Energy Consumption Data",
      col.names=c("Operation Type", "City", "GHG Emissions (kg)", "Year"),
      linesep = "", digits = 2, booktabs=TRUE) %>%
    kable_styling(latex_options = "HOLD_position", font_size = 10)

# linear models ----

model1 <- lm(ghg_emissions_kg ~ year, data = energy_2015_2018)
summary(model1)

plot(model1)

plot(energy_2015_2018$year, energy_2015_2018$ghg_emissions_kg)
abline(lm(ghg_emissions_kg ~ year, data = energy_2015_2018))
