library(tidyr)
library(ggplot2)

#Make a double bar chart for the years 2019-2023 for Landbouw and Bouw with the cleaned data set of Emission (DataSetEmissieClean) and use a scale log10 on the y-axis because the Emission values of Landbouw are significantly higher than Bouw.

ggplot(DataSetEmissieClean, aes(x = factor(Jaar), y = Emissie, fill = Sector)) +
  scale_y_log10() +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Emission per Year per Sector",
    x = "Year",
    y = "Emission (kg)",
    fill = "Sector"
  ) +
  theme_minimal()

