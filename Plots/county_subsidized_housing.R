library(tidyverse)

source("Data_Prep/subsidized_housing_cleanup.R")

#graphs for subsidized housing
subsidized_housing_plot <- function (county) {
  yearly_subsidized_housing %>% mutate(year = factor(year)) %>% filter(county==county, LSAD == "County") %>%
    group_by(total_subsidized_housing, year)%>% ggplot(aes(yearly_subsidized_housing$year, yearly_subsidized_housing$total_subsidized_housing)) + 
  geom_line() + labs(title="Subsidized Housing in Virginia per County", subtitle="(2015-2019)",
                     x ="Year", y = "Population (Counts)", caption  = "Source: 	U.S. Department of Housing and Urban Development")
}
subsidized_housing_plot("Rockbridge")


yearly_subsidized_housing %>% filter(county== "Rockbridge") %>% ggplot(aes(yearly_subsidized_housing$year, yearly_subsidized_housing$total_subsidized_housing)) + 
  geom_line() + labs(title="Subsidized Housing in Virginia per County", subtitle="(2015-2019)",
                     x ="Year", y = "Population (Counts)", caption  = "Source: 	U.S. Department of Housing and Urban Development")
  