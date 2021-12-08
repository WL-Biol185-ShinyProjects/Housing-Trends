#Per capita income in the past 12 months from 2010-2019 in VA Plot
#Creating a line graph
library(ggplot2)
library(tidyverse)

#Factor year variable
Income_Per_Capita <- read_csv("Data/incomepercapitainVA.csv")

#Make the graph
Income_Per_Capita_Plot <- Income_Per_Capita %>% mutate(year = factor(year)) %>% group_by(per.capita.income, year) %>% 
    ggplot(aes(x = year, y = per.capita.income, group = 1)) + geom_line(stat='identity')


# function to get income per capita by year for info box on main map
perCapitaByYear <- function (yearToUse) {
  Income_Per_Capita %>% filter(year == yearToUse) %>% select(per.capita.income)
}
