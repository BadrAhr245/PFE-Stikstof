library(tidyr)
library(ggplot2)

#1. Merge the cleaned tables of Emission of Bouw and Landbouw for the years 2019-2023
combined_data <- merge(DataSetEmissieCleanBouw, DataSetEmissieCleanLandbouw, by = "Jaar")

#2. Remove the 2015 row, because we start 2019 as the baseline measurement for our graph, 
combined_data <- combined_data %>%
  filter(Jaar != 2015)

#3. Make a double bar chart for Bouw and Landbouw for the Emission per Year per Sector
ggplot(combined_data, aes(x = factor(Jaar), y = Emissie.x, fill = Sector.x)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Emission per Year per Sector",
    x = "Jaar",
    y = "Emissie",
    fill = "Sector"
  ) +
  theme_minimal()


plot_data <- combined_data %>%
  pivot_longer(
    cols = c(Emissie.x, Emissie.y, Sector.x, Sector.y),
    names_to = c(".value", "set"),
    names_pattern = "(.*)\\.(.)"
  )


plot_data$Sector <- ifelse(plot_data$set == "x", "Bouw", "Landbouw")

ggplot(plot_data, aes(x = factor(Jaar), y = Emissie, fill = Sector)) +
  scale_y_log10() +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Emission per Year per Sector",
    x = "Year",
    y = "Emission (kg)",
    fill = "Sector"
  ) +
  theme_minimal()

