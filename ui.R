library(shiny)
library(leaflet)

navbarPage("Housing Trends",
           tabPanel("Race Across Time in VA", 
                    fluidPage(
                      # The page title
                      titlePanel("Race across Time in VA"),
                      
                      # A row for this plot that has a sidebar
                      fluidRow(
                        column(9,
                               plotOutput("racePlot")
                        )
                      )
                    )
                  ),
           # Page for our map
           tabPanel("Map", #leafletOutput("theMap", height = 1000)),
                    fluidPage(
                      
                      titlePanel("Number of Occupied Housing Units by Year"),
                      
                      sidebarLayout(
                        
                        sidebarPanel(
                          sliderInput(
                            "bins", label = "Year:",
                            min = 2010, value = 2015, max = 2019
                          )
                        ),
                        
                        mainPanel(
                          leafletOutput("theMap", height = 1000)
                        )
                      )
                    )
           ),
           
           # Page for something else in the future
           tabPanel("Another Page",
                    fluidRow("This is another page")
                    )
          )