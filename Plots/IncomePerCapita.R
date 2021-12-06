#Per capita income in the past 12 months from 2010-2019 in VA Plot
#Creating a line graph
library(ggplot2)
library(tidyverse)

Income_Per_Capita <- read_csv("Data/incomepercapitainVA.csv")
<<<<<<< HEAD
  #Make the years factors so they don't have decimals
Income_Per_Capita_Plot <- ggplot(data = Income_Per_Capita) + geom_line(mapping = aes(x = year, y = per.capita.income))
=======
>>>>>>> 1f1ca560abff4712562c2e6f7aaeba60a6c225fb

#Make the years factors so they don't have decimals
Income_Per_Capita_Plot <- ggplot(Income_Per_Capita, aes(x = year , y = per.capita.income))+ geom_line(stat='identity')

# function to get income per capita by year for info box on main map
perCapitaByYear <- function (yearToUse) {
  Income_Per_Capita %>% filter(year == yearToUse) %>% select(per.capita.income)
}
