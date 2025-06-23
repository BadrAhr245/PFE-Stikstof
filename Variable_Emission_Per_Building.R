library(tidyverse)
library(dplyr)
library(ggplot2)

#First run DataSetCleanCode for DataSetEmissieClean and NieuwbouwClean, then filter out the year 2015 and only take the data for which Sector = Bouw
filtered_emissie_bouw <- DataSetEmissieClean %>%
  filter(Sector == "Bouw" & Jaar >= 2019)

#Merge the existing NieuwbouwClean table, which contains information about the Aantalwoningen per year, with filtered_emissie_bouw
merged_data_emissiebouw = merge(NieuwbouwClean, filtered_emissie_bouw, by = "Jaar")

#Create a new variable which states the average emission per constructed building for the years 2019-2023 > av_emission_per_building
merged_data_emissiebouw = mutate(merged_data_emissiebouw, av_emission_per_building = Aantalwoningen/Emissie)

#Plot data in a bar chart
ggplot(merged_data, aes(x=Jaar, y=av_emission_per_building)) + 
  geom_col(fill = "blue") +
  scale_y_continuous(breaks = c(0:15)*2.5, lim = c(0, 13)) +
  labs(
  x = "Year",
  y = "Average emission per building (kg)",
  title = "Average Emission per Constructed Building 2019-2023"
  )



       