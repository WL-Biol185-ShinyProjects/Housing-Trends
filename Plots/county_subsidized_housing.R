#graphs for subsidized housing
subsidized_housing_plot <- function (countytoUse) {
  yearly_subsidized_housing %>% mutate(year = factor(year)) %>% filter(county==countytoUse, LSAD == "County") %>% 
    ggplot(aes(year, total_subsidized_housing, group=1)) + 
    geom_bar(stat="identity") + 
    labs(x ="Year", y = "Population (Counts)", caption  = "Source: 	U.S. Department of Housing and Urban Development")
}

