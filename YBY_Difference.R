library(tidyr)
library(ggplot2)
library(dplyr)

only_bouw_clean <- DataSetEmissieClean %>% filter(Sector == "Bouw")
#1. merge tables
merged_table <- merge(NieuwbouwClean, only_bouw_clean, by = "Jaar")
#2. remove the 2015 row, because we start 2019 as the baseline measurement for our graph
merged_table <- merged_table[-1, ]
#3. Loop over all the rows and check the previous "Aantalwoningen" and "Emissie" and get the %difference
df <- data.frame(
  Jaar = merged_table$Jaar,
  Aantalwoningen = merged_table$Aantalwoningen,
  Emissie = merged_table$Emissie
)

# Added two extra columns that show the percental difference. We use -1 because the value in the last year 2023 cannot be compared
df$diff_Aantalwoningen <- c(NA, diff(df$Aantalwoningen) / head(df$Aantalwoningen, -1) * 100)
df$diff_Emissie <- c(NA, diff(df$Emissie) / head(df$Emissie, -1) * 100)

print(df)

#4. Manually create a long-format dataframe for plotting
Variable <- rep(c("Aantalwoningen % Diff", "Emissie % Diff"), each = nrow(df))
Jaar <- rep(df$Jaar, 2)
Percent_Diff <- c(df$diff_Aantalwoningen, df$diff_Emissie)

df_long <- data.frame(Jaar = Jaar, Variable = Variable, Percent_Diff = Percent_Diff)

#5. Make plot double bar chart per year for Aantalwoningen % Diff and Emissie % Diff
ggplot(df_long, aes(x = factor(Jaar), y = Percent_Diff, fill = Variable)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8)) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray40") +
  geom_text(aes(label = ifelse(is.na(Percent_Diff), "", round(Percent_Diff, 1))),
            position = position_dodge(width = 0.8), vjust = -0.5, size = 3) +
  labs(
    title = "Year-over-Year Percentage Difference\nAantalwoningen and Emissie",
    x = "Year",
    y = "Percentage Difference (%)",
    fill = "Variable"
  ) +
  theme_minimal()


