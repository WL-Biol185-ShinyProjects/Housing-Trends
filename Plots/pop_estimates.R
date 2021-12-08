library(readxl)
#getting the population estimates for VA

co_est2019_VA <- read_excel("Data/Population Estimates/co_est2019_VA.xlsx")

# function to get income per capita by year for info box on main map
popEstimates <- function (yearToUse) {
  co_est2019_VA %>% filter(year == yearToUse) %>% select(pop_estimate)
}