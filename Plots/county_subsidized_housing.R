#graphs for subsidized housing
subsidized_housing_plot <- function (chosenCounties) {
  yearly_subsidized_housing %>% mutate(year = factor(year)) %>% filter(county %in% chosenCounties, LSAD == "County") %>% 
    ggplot(aes(year, total_subsidized_housing, group=county, color = county)) + 
    geom_line() + 
    labs(x ="Year", y = "Population (Counts)", caption  = "Source: 	U.S. Department of Housing and Urban Development")
}

