library(shiny)
library(tidyverse)
library(leaflet)

# Importing the plots here so we can separate each plot's logic and prevent conflict
source("Plots/racePlot.R")
# source("Plots/housingLeafletMap.R")
# source("Plots/popEstLeafletMap.R")
source("Plots/leafletMap.R")
source("Plots/racePlotII.R")
source("Plots/electionMap.R")
source("Plots/IncomePerCapita.R")
source("Plots/VA_homeless.R")
source("Plots/pop_estimates.R")
source("Plots/crime_VA.R")
source("Plots/VA_homeless.R")

# Importing county json only once to pass in where needed
geo <- readOGR("Data/counties.json")

function (input, output) {
  # Rendering the bar plot
  output$racePlot <- renderPlot({racePlot})
  
  #Rendering the race line graph per county
  output$racePlotII <- renderPlot({racePlotII(input$county)})
  
  #Rendering the VA Homelessnes line graph
  output$homelessness <- renderPlot({homelessness})
  
  #Rendering the income plot
  output$IncomePerCapita <- renderPlot({Income_Per_Capita_Plot})
  
  # Rendering the occupied housing units map
  # output$housingMap <- renderLeaflet({housingLeafletMap(geo, input$housingYear)})
  
  # Rendering the population estimates map
  # output$popEstMap <- renderLeaflet({popEstLeafletMap(geo, input$popEstYear)})
  
  # Rendering the Election map
  output$electionMap <- renderLeaflet({electionMap(geo, input$electionYear)})
  
  # Rendering the all data on the same map
  output$theMap <- renderLeaflet({allLeafletMap(geo, input$year, input$variable)})
  
  # Rendering Value Box showing Per Capita Income in the given year
  output$perCapitaIncomeBox <- renderValueBox({
    valueBox(
      width = 2,
      perCapitaByYear(input$year), paste("Per Capita Income in ", input$year), icon = icon("money-bill-wave"),
      color = "green" 
    )
  })
  output$popEstimatesBox <- renderValueBox({
    valueBox(
      popEstimates(input$year),
      width = 2,
      paste("Population Estimate of VA in ", input$year), icon = icon("users"),
      color = "blue" 
    )
  })
    output$crimeEstimatesBox <- renderValueBox({
      valueBox(
        crimeEstimates(input$year), 
        width = 2,
        paste("Total Violent & Property Crime of VA in ", input$year), icon = icon("gavel"),
        color = "red" 
      )
  })
    output$homelessEstimatesBox <- renderValueBox({
     valueBox(
        homelessEstimates(input$year), 
        width = 2,
        paste("Total Homeless in ", input$year) , icon = icon("door-closed"),
        color = "yellow" 
      )
  })
}