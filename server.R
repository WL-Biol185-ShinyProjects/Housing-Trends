library(shiny)
library(tidyverse)

# Import the data from the csv
race_ethinicity <- read.csv("Data/race-and-ethnicity.csv")
# Lowercasing all the column names
colnames(race_ethinicity) <- tolower(colnames(race_ethinicity))

function (input, output) {
  # Rendering the bar plot
  output$racePlot <- renderPlot({
    race_ethinicity %>%
      mutate(year = factor(year)) %>%
      group_by(race, year) %>%
      ggplot(aes(year, population, fill=race)) + geom_bar(stat = "identity", position = "dodge") +
      theme(axis.text.x = element_text(angle = 30, size = 10)) +
      scale_y_continuous(trans='log10')
  })
}