library(shiny)
library(tidyverse)
library(leaflet)

# Importing the plots here so we can separate each plot's logic and prevent conflict
source("Plots/racePlot.R")
# source("Plots/housingLeafletMap.R")
# source("Plots/popEstLeafletMap.R")
source("Plots/leafletMap.R")

# Importing county json only once to pass in where needed
geo <- readOGR("Data/counties.json")

function (input, output) {
  # Rendering the bar plot
  output$racePlot <- renderPlot({racePlot})
  
  # Rendering the occupied housing units map
  # output$housingMap <- renderLeaflet({housingLeafletMap(geo, input$housingYear)})
  
  # Rendering the population estimates map
  # output$popEstMap <- renderLeaflet({popEstLeafletMap(geo, input$popEstYear)})
  
  # Rendering the all data on the same map
  output$theMap <- renderLeaflet({allLeafletMap(geo, input$year, input$variable)})
}