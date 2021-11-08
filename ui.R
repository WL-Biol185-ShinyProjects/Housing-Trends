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
           # Page for housing units map
           # tabPanel("Map", #leafletOutput("theMap", height = 1000)),
           #          fluidPage(
           #            
           #            titlePanel("Number of Occupied Housing Units by Year"),
           #            
           #            sidebarLayout(
           #              
           #              sidebarPanel(
           #                sliderInput(
           #                  "housingYear", label = "Year:", sep="", animate=TRUE,
           #                  min = 2010, value = 2015, max = 2019,
           #                )
           #              ),
           #              
           #              mainPanel(
           #                leafletOutput("housingMap", height = 900)
           #              )
           #            )
           #          )
           #        ),
           # Page for population estimates map
           # tabPanel("Pop Est Map",
           #          fluidPage(
           #            
           #            titlePanel("Population Estimates by Year in VA"),
           #            
           #            sidebarLayout(
           #              
           #              sidebarPanel(
           #                sliderInput(
           #                  "popEstYear", label = "Year:", sep="", animate=TRUE,
           #                  min = 2010, value = 2015, max = 2019,
           #                )
           #              ),
           #              
           #              mainPanel(
           #                leafletOutput("popEstMap", height = 900)
           #              )
           #            )
           #          )
           # ),
           
           # Page for maps with factors
           tabPanel("Map",
                    fluidPage(
                      
                      titlePanel("Pick a variable to look at"),
                      
                      sidebarLayout(
                        
                        sidebarPanel(
                          sliderInput(
                            "year", label = "Year:", sep="", animate=TRUE,
                            min = 2010, value = 2015, max = 2019,
                          ),
                          selectInput("variable", "Variable:",
                                      c("Occupied Housing Units" = "housing_units",
                                        "Population Estimates" = "pop_estimate",
                                        "something else" = "something else"))
                        ),
                        
                        mainPanel(
                          leafletOutput("theMap", height = 900)
                        )
                      )
                    )
           ),
           
           # Page for something else in the future
           tabPanel("Another Page",
                    fluidRow("This is another page")
                    )
          )