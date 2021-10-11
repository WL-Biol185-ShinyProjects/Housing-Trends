# This file is just for working on the graphs/plots without having to spin up the shiny app

library(tidyverse)

race_ethinicity <- read.csv("Data/race-and-ethnicity.csv")
colnames(race_ethinicity) <- tolower(colnames(race_ethinicity))

# Race across time
race_ethinicity %>%
  mutate(year = factor(year)) %>%
  group_by(race, year) %>%
  ggplot(aes(year, population, fill=race)) + geom_bar(stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 30, size = 10)) +
  scale_y_continuous(trans='log10')
