# Load the required libraries
library(readxl) # For reading excel files
library(tidyverse) # For data manipulation and visualizations

# Read the first row of the excel file to extract the column names
kolomnamen <- read_excel("EnergieverbruikLandbouw.xlsx", skip = 0, n_max = 1) %>%
  unlist() %>%
  as.character()

# Read the actual data from the 4th row
Perioden_Energiegebruik <- read_excel("EnergieverbruikLandbouw.xlsx", skip = 3, col_names = FALSE)

# Assigning the previous extracted column names to the dataset
colnames(Perioden_Energiegebruik) <- kolomnamen

# Filter the data to only include the row called "Totaal energiedragers"
#Select only the columns for the years 2019 to 2023
Perioden_EnergiegebruikClean <- Perioden_Energiegebruik %>%
  filter(Perioden == "Totaal energiedragers") %>%
  select(Perioden, `2019`, `2020`, `2021`, `2022`, `2023**`)

# Rename the column 2023** to 2023
Perioden_EnergiegebruikClean <- Perioden_EnergiegebruikClean %>%
  rename(`2023` = `2023**`)

# Reshape the data from wide to long format
Event_analysis_plot <- Perioden_EnergiegebruikClean %>%
pivot_longer(
cols = c("2019", "2020", "2021", "2022", "2023"),
names_to = "jaar",
values_to = "energie"
) %>%
mutate(jaar = as.numeric(jaar),
    energie = as.numeric(energie)
    )
          
# Creating the event analysis plot
ggplot(Event_analysis_plot, aes(x = jaar, y = energie)) +
geom_line(color = "steelblue", size = 1.2) +
geom_point(size = 2) +
            

geom_segment(aes(x = 2021, xend = 2022,y = energie[jaar == 2021],
      yend = energie[jaar == 2022]),
      arrow = arrow(type = "closed", length = unit(0.2, "inches")),
      color = "red", size = 1.2,
  inherit.aes = FALSE) +
            
  
annotate("segment", x = 2021, xend = 2022, 
         y = Event_analysis_plot$energie[Event_analysis_plot$jaar == 2021],
         yend = Event_analysis_plot$energie[Event_analysis_plot$jaar == 2022],
         arrow = arrow(type = "closed", length = unit(0.2, "inches")),
         color = "red", size = 1.2
)

