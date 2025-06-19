install.packages("tidyverse")
install.packages("Rtools")
install.packages("readxl")
library(readxl)



Nieuwbouw = read_xlsx("Nieuwbouw.xlsx")
EmissieDataSet = read_xlsx("EmissieDataSet.xlsx")
EnergieVerbruikLandbouw = read_xlsx("EnergieverbruikLandbouw.xlsx")
EnergieVerbruikBouw = read_xlsx("EnergieverbruikBouw.xlsx")
EmissieDataSetBeNeLux = read_xlsx("EmissionBeNeLux.xlsx")


Nieuwbouw0 <- Nieuwbouw[-1,]
j2012 = as.numeric(Nieuwbouw0[12, 2])
j2013 = as.numeric(Nieuwbouw0[24, 2])
j2014 = as.numeric(Nieuwbouw0[36, 2])
j2015 = as.numeric(Nieuwbouw0[48, 2])
j2016 = as.numeric(Nieuwbouw0[60, 2])
j2017 = as.numeric(Nieuwbouw0[72, 2])
j2018 = as.numeric(Nieuwbouw0[84, 2])
j2019 = as.numeric(Nieuwbouw0[96, 2])
j2020 = as.numeric(Nieuwbouw0[108, 2])
j2021 = as.numeric(Nieuwbouw0[120, 2])
j2022 = as.numeric(Nieuwbouw0[132, 2])
j2023 = as.numeric(Nieuwbouw0[144, 2])
NieuwbouwClean = data.frame(
  Jaar = c("2012", "2013", "2014", "2015", "2016", "2017", 
           "2018", "2019", "2020", "2021", "2022", "2023"),
  Aantalwoningen = c(j2012, j2013, j2014, j2015, j2016, j2017, j2018, j2019, j2020, j2021, j2022, j2023)
)
View(NieuwbouwClean)



DataSetEmissie0 <- EmissieDataSet[,-10:-26]
DataSetEmissie1 <- DataSetEmissie0[-18:-41,-1:-7]
DataSetEmissieClean <- DataSetEmissie1[12:23,]
View(DataSetEmissieClean)



EnergieverbruikBouw0 <- EnergieverbruikBouw[-2,]
EnergieverbruikBouwClean <- EnergieverbruikBouw0[,-1]
rownames(EnergieverbruikBouwClean) = c("Periode", "Total usage build sector")
View(EnergieverbruikBouwClean)



EnergieverbruikLandbouw0 <- EnergieverbruikLandbouw[-2,]
EnergieverbruikLandbouwClean <- EnergieverbruikLandbouw0[,-1]
rownames(EnergieverbruikLandbouwClean) = c("Periode", "Total usage agriculture sector")
View(EnergieverbruikLandbouwClean)




