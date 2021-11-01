library(shiny)
library(tidyverse)
library(leaflet)

# Importing the plots here so we can separate each plot's logic and prevent conflict
source("Plots/racePlot.R")
source("Plots/leafletMap.R")

# Importing county json only once to pass in where needed
geo <- readOGR("Data/counties.json")

# Import the data from the csv
# race_ethinicity <- read.csv("Data/race-and-ethnicity.csv")
# Lowercasing all the column names
# colnames(race_ethinicity) <- tolower(colnames(race_ethinicity))

function (input, output) {
  # Rendering the bar plot
  output$racePlot <- renderPlot({racePlot})
  output$theMap <- renderLeaflet({leafletMap(geo, input$year)})
}