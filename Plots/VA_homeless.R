X2010_2015_PIT_Counts_by_State <- read_excel("Data/Homelessness/2010_2015_PIT_Counts_by_State.xlsx")                                                                                                                                                      

homelessness <- ggplot(X2010_2015_PIT_Counts_by_State, aes(x=Year, y=Total_Homeless)) + geom_line() + 
  labs(x ="Year", y = "People (Counts)", caption  = "Source: 2015 Annual Homeless Assessment Report (AHAR)")


# function to get income per capita by year for info box on main map
homelessEstimates <- function (yearToUse) {
  X2010_2015_PIT_Counts_by_State %>% filter(Year == yearToUse) %>% select(Total_Homeless)
}
