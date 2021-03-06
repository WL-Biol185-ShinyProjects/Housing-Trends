Average_Income <- merged_income_race_data %>% mutate(Year = factor(Year)) %>% 
  ggplot(aes(x = Year, y = Mean_Income, color = Race_Ethnicity, group = Race_Ethnicity)) + geom_line(size = 0.75) + 
  labs(x ="Year", y = "Average Income", caption  = "Source: US Census Bureau") + scale_color_brewer(palette= "Spectral")

