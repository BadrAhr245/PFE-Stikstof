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

DataSetEmissieClean <- DataSetEmissie2[-48:-59,]
DataSetEmissie0 <- EmissieDataSet[,-10:-26]
DataSetEmissie1 <- DataSetEmissie0[,-1:-7]
DataSetEmissie2 <- DataSetEmissie1[-1:-41,]
DataSetEmissieClean <- DataSetEmissie2[-48:-59,]
View(DataSetEmissieClean)