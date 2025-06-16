library(tidyr)
library(ggplot2)

# Make a double bar chart with the cleaned data set of Emission.
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

