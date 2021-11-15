library(ggplot2)
library(tidyverse)
source("Data_Prep/Race_Demographics_cleanup.R")

ggplot(merged_race_data, aes(Year, County)) + geom_line()

merged_race_data %>% mutate(Year = factor(Year)) %>% filter(County == "Rockbridge") %>%
  group_by(Race, Year)%>% ggplot(aes(Year, Race_estimate, color= Race ,group=Race)) + geom_line()

