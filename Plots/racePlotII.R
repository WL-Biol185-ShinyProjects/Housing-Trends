racePlotII <- function (countyName) {
  merged_race_data %>% mutate(Year = factor(Year)) %>% filter(county == countyName, LSAD == "County") %>%
    group_by(Race, Year)%>% ggplot(aes(Year, Race_estimate, color= Race, group=Race)) + geom_line() + scale_y_continuous(trans='log10') + labs (y = "Race Estimates (Counts)", caption= "Source: US Census") 
}