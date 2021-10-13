library(tidyverse)

racePlot <- race_ethinicity %>%
  mutate(year = factor(year)) %>%
  group_by(race, year) %>%
  ggplot(aes(year, population, fill=race)) + geom_bar(stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 30, size = 10)) +
  scale_y_continuous(trans='log10')