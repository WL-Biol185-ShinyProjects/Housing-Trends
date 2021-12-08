#Income per capita income by race between 2010-2019 clean-up 
library(tidyverse)
library(dplyr)

source("Data_Prep/Income_per_capita_race_cleanup.R")
Average_Income <- merged_income_race_data %>% mutate(Year = factor(Year)) %>% 
  ggplot(aes(x = Year, y = Mean_Income, color = Race_Ethnicity, group = Race_Ethnicity)) + geom_line()