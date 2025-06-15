library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

data <- read.csv2("Energieverbruik_Landbouw.csv")

data_raw <- read.csv("Energieverbruik_Landbouw.csv", header = FALSE, sep = ";", stringsAsFactors = FALSE)

data_transposed <- as.data.frame(t(data_raw), stringsAsFactors = FALSE)

colnames(data_transposed) <- data_transposed[1, ]
data_transposed <- data_transposed[-1, ]

rownames(data_transposed) <- NULL

df_filtered_landbouw <- data_transposed %>%
  filter(Perioden >= 2019)

View(df_filtered_landbouw)
