education_homelessness_plot <- function(chosenCounties) {
  homeless_students_enrolled %>% filter(LEANM %in% chosenCounties) %>%
    ggplot(aes(x = factor(year), student_counts, color=LEANM, group = LEANM)) + 
    geom_line(size=0.75) + xlab("Academic Year") + ylab("Homeless Students Enrolled (Counts)") + labs(color = "LEANM") +  scale_color_brewer(palette = "Spectral")
}
