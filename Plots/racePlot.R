racePlot <- race_ethnicity %>%
  mutate(year = factor(year)) %>%
  group_by(race, year) %>%
  ggplot(aes(year, population, fill=race)) + geom_bar(stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 30, size = 10)) +
  scale_y_continuous(trans='log10') + labs(x ="Year", y = "Population (Counts)", fill = "Race", caption  = "Source: US Census") +
  scale_fill_brewer(palette="Spectral", direction = -1) 

