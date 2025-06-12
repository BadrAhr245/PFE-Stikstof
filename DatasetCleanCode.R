Nieuwbouw0 <- Nieuwbouw[-1,]
j2012 = sum(as.numeric(Nieuwbouw0[2:13, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[14:25, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[26:37, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[38:49, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[50:61, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[62:73, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[74:85, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[86:97, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[98:109, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[110:121, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[122:133, 2]))
j2012 = sum(as.numeric(Nieuwbouw0[134:145, 2]))
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