library(shiny)
library(tidyverse)

# Importing the plots here so we can separate each plot's logic and prevent conflict
source("Plots/racePlot.R")

# Import the data from the csv
race_ethinicity <- read.csv("Data/race-and-ethnicity.csv")
# Lowercasing all the column names
colnames(race_ethinicity) <- tolower(colnames(race_ethinicity))

function (input, output) {
  # Rendering the bar plot
  output$racePlot <- renderPlot({racePlot})
}