#Per capita income in the past 12 months from 2010-2019 in VA Plot
#Creating a line graph
library(ggplot2)
library(tidyverse)
Income_Per_Capita <- read_csv("Data/incomepercapitainVA.csv")
  #Make the years factors so they don't have decimals
Income_Per_Capita_Plot <- ggplot(Income_Per_Capita, aes(x = year , y = per.capita.income))+ geom_line(stat='identity')


  
