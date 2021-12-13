library(shiny)
library(tidyverse)
library(leaflet)
library(readxl)
library(rgdal)

# Clean Data Imports
source("Data_Prep/population_estimates_cleanup.R")
source("Data_Prep/DCOHU_data_cleanup.R")
source("Data_Prep/MedianAgeEstimate_cleanup.R")
source("Data_Prep/education_estimates_cleanup.R")
source("Data_Prep/crime_estimates_cleanup.R")
source("Data_Prep/subsidized_housing_cleanup.R")
source("Data_Prep/Income_per_capita_race_cleanup.R")
source("Data_Prep/presidential_voting_cleanup.R")
source("Data_Prep/race_data_cleanup.R")
source("Data_Prep/education_homelessness_cleanup.R")


# Plot Imports
source("Plots/racePlot.R")
source("Plots/racePlotII.R")
source("Plots/leafletMap.R")
source("Plots/electionMap.R")
source("Plots/IncomePerCapita.R")
source("Plots/VA_homeless.R")
source("Plots/crimePlot.R")
source("Plots/pop_estimates.R")
source("Plots/crime_VA.R")
source("Plots/VA_homeless.R")
source("Plots/Average_Income_Plot.R")
source("Plots/county_subsidized_housing.R")
source("Plots/homeless_students.R")

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
  
  # Rendering Crime Plot
  output$crimePlot <- renderPlot({crimePlot(input$crimeCounty)})
  
  
  # Rendering Student Plot
  output$education_homelessness <- renderPlot({education_homelessness_plot(input$studentCounty)})

  #Rendering the average income by race plot 
  output$Average_Income_Plot <- renderPlot({Average_Income})
  
  #Rendering the subsidized housing plot
  output$subsidizedPlot <- renderPlot({subsidized_housing_plot(input$subCounty)})
  
  # Rendering the occupied housing units map
  # output$housingMap <- renderLeaflet({housingLeafletMap(geo, input$housingYear)})
  
  # Rendering the population estimates map
  # output$popEstMap <- renderLeaflet({popEstLeafletMap(geo, input$popEstYear)})
  
  # Rendering the Election map
  output$electionMap <- renderLeaflet({electionMap(geo, input$electionYear)})
  
  # Rendering the all data on the same map
  output$theMap <- renderLeaflet({allLeafletMap(geo, input$year, input$variable)})
  
  # Rendering Value Box showing Per Capita Income in the given year
  output$popEstimatesBox <- renderValueBox({
    valueBox(
      popEstimates(input$year),
      width = 2,
      paste("Population Estimate of VA in ", input$year), icon = icon("users"),
      color = "blue" 
    )
  })
  output$perCapitaIncomeBox <- renderValueBox({
    valueBox(
      width = 2,
      perCapitaByYear(input$year), paste("Per Capita Income in ", input$year), icon = icon("money-bill-wave"),
      color = "purple" 
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
    # #output$homelessEstimatesBox <- renderValueBox({
    #  valueBox(
    #     homelessEstimates(input$year), 
    #     width = 2,
    #     paste("Total Homeless in ", input$year) , icon = icon("door-closed"),
    #     color = "yellow" 
    #   )
}