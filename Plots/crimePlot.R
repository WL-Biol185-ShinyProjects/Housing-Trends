#chosenCounties <- c("Accomack", "Alleghany")

# datasets <- c(
#   "pop_estimate" = pop_est,
#   "median_age" = merged_medianage_data,
#   "enrollment_estimate" = yearly_local_enrollment,
#   "total_violent_pop_crime_estimate" = yearly_crime_est,
#   "housing_units" = clean_dcohu)
# 
# 
# dfs <- list(yearly_crime_est, yearly_local_enrollment,merged_medianage_data, pop_est, clean_dcohu) %>%
#   reduce(left_join, by = c("county" = "county", 
#                            "LSAD" = "LSAD"))

crimePlot <- function(chosenCounties) {
  yearly_crime_est %>% filter(county %in% chosenCounties) %>%
    ggplot(aes(x = factor(year), total_violent_pop_crime_estimate, color=county, group = county)) + 
    geom_line() + xlab("Year") + ylab("Violent Crime Estimate") + labs(color = "Counties")
}

