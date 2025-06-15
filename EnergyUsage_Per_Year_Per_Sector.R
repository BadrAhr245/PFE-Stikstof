library(tidyr)
library(ggplot2)

#1. Merge the cleaned tables of Energy Usage of Bouw and Landbouw for the years 2019-2023
combined_data <- merge(df_filtered_bouw, df_filtered_landbouw, by = "Perioden")

plot_data <- combined_data %>%
  pivot_longer(
    cols = c("Totaal energiedragers.x", "Totaal energiedragers.y", Onderwerp.x, Onderwerp.y),
    names_to = c(".value", "set"),
    names_pattern = "(.*)\\.(.)"
  )

plot_data$`Totaal energiedragers` <- as.numeric(gsub(",", ".", plot_data$`Totaal energiedragers`))


plot_data$Sector <- ifelse(plot_data$set == "x", "Bouw", "Landbouw")

ggplot(plot_data, aes(x = factor(Perioden), y = `Totaal energiedragers`, fill = Onderwerp)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Energy Usage per Year per Sector",
    x = "Year",
    y = "Energy Usage (Pentajoule)",
    fill = "Sector"
  ) +
  theme_minimal()

