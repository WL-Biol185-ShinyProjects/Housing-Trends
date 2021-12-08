#getting the total violent and propert crime estimates for VA

crime_VA <- read_excel("Data/Crime/crime_VA.xlsx")

# get income per capita by year for info box on main map
crimeEstimates <- function (yearToUse) {
  crime_VA %>% filter(year == yearToUse) %>% select(crime_estimate)
}