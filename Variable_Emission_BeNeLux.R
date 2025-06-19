#install.packages(c("ggplot2", "sf", "rnaturalearth", "rnaturalearthdata", "dplyr"))
library(ggplot2)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(dplyr)

land_oppervlak_km2 <- c("Belgium" = 30528, "Luxembourg" = 2586, "Netherlands" = 41543)

landen <- rownames(EmissieDataSetBeNeLuxClean)
jaren <- colnames(EmissieDataSetBeNeLuxClean)

tabelland <- c()
tabeljaar <- c()
tabelemissie <- c()

for (land in landen) {
  for (jaar in jaren) {
    emissie <- as.numeric(EmissieDataSetBeNeLuxClean[land, jaar])
    oppervlak <- land_oppervlak_km2[land]
    emissie_per_km2 <- as.numeric(emissie / oppervlak)
    code <- paste0("Emission", land, jaar, "KM2")
    assign(code, emissie_per_km2)
    
    tabelland <- c(tabelland, land)
    tabeljaar <- c(tabeljaar, jaar)
    tabelemissie <- c(tabelemissie, emissie_per_km2)
  }
}

tabeltotaal_emissieKM2 <- data.frame(
  Land = tabelland,
  Jaar = tabeljaar,
  EmissiePerKM2 = tabelemissie
)


ggplot(tabeltotaal_emissieKM2, aes(x = as.integer(Jaar), y = EmissiePerKM2, color = Land)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  labs(
    title = "Emissie per km² per jaar",
    x = "Jaar",
    y = "Emissie per km²",
    color = "Land"
  ) +
  theme_minimal()





world <- ne_countries(scale = "medium", returnclass = "sf")

benelux_map <- world %>%
  filter(name %in% c("Belgium", "Netherlands", "Luxembourg"))

rownames(EmissieDataSetBeNeLuxClean) <- c("Belgium", "Luxembourg", "Netherlands")

emission_2022 <- EmissieDataSetBeNeLuxClean[1:3,"2022"]
emission_df_2022 <- data.frame(
  name = rownames(EmissieDataSetBeNeLuxClean),
  Emission2022 = c(as.numeric(emission_2022[1,1]),as.numeric(emission_2022[2,1]), as.numeric(emission_2022[3,1]))
)

benelux_map_2022 <- benelux_map %>%
  left_join(emission_df_2022, by = "name")

ggplot(benelux_map_2022) +
  geom_sf(aes(fill = Emission2022)) +
  scale_fill_gradient(low = "lightblue", high = "darkred") +
  labs(
    title = "Emissie per land in 2022 (Benelux)",
    fill = "Emissie"
  ) +
  coord_sf(xlim = c(2, 9), ylim = c(49, 55), expand = FALSE) +
  theme_minimal()


