library(shiny)
library(leaflet)
library(shinydashboard)

source("Data_Prep/Race_Demographics_cleanup.R")

dashboardPage(
  dashboardHeader(title="Housing Trends in Virginia"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Main Map", tabName = "maps", icon = icon("map")),
      menuItem("Race and Ethinicity", tabName = "race_in_va", icon = icon("clock")),
      menuItem("Income, Education, and Voting Patterns", tabName = "IncomePerCapita", icon = icon("money"), width = 6)
    )
  ),
  dashboardBody(
    tabItems(
      # All Maps
      tabItem(tabName="maps",
              fluidRow(
                box(status = "primary", leafletOutput("theMap", height = 900, width= 900)),
                
                box(
                  title = "Controls",
                  status = "warning",
                  sliderInput(
                    "year", label = "Year:", sep="", animate=TRUE,
                    min = 2010, value = 2015, max = 2019,
                   ),
                  selectInput("variable", "Variable:",
                              c("Occupied Housing Units" = "housing_units",
                                "Population Estimates" = "pop_estimate",
                                "Median Age Estimates" = "median_age",
                                "Education Enrollment" = "enrollment_estimate",
                                "Crime Estimates" = "total_violent_pop_crime_estimate")
                              )
                  )
                )
              ),
      # Bar plot of Race Across Time
      tabItem(tabName="race_in_va",
              h2("Race Across Time in Virginia"),
              fluidRow(
                box(status = "primary", width = 12, plotOutput("racePlot")),
                h2("Race Across Time per County"),
                fluidRow(
                  box(status = "primary", width = 8, plotOutput("racePlotII")),
                  box(
                    title = "Controls",
                    status = "warning",
                    width = 4,
                    selectInput("county", "County", choices = unique(merged_race_data$county))
                  )
                )
              )
      )
    )
    
  )
)




# navbarPage("Housing Trends",
#            tabPanel("Race Across Time in VA", 
#                     fluidPage(
#                       # The page title
#                       titlePanel("Race across Time in VA"),
#                       
#                       # A row for this plot that has a sidebar
#                       fluidRow(
#                         column(9,
#                                plotOutput("racePlot")
#                         )
#                       )
#                     )
#                   ),
#            # Page for maps with factors
#            tabPanel("Map",
#                     fluidPage(
#                       
#                       titlePanel("Pick a variable to look at"),
#                       
#                       sidebarLayout(
#                         
#                         sidebarPanel(
#                           sliderInput(
#                             "year", label = "Year:", sep="", animate=TRUE,
#                             min = 2010, value = 2015, max = 2019,
#                           ),
#                           selectInput("variable", "Variable:",
#                                       c("Occupied Housing Units" = "housing_units",
#                                         "Population Estimates" = "pop_estimate",
#                                         "Median Age Estimates" = "median_age",
#                                         "Education Enrollment" = "enrollment_estimate",
#                                         "Crime Estimates" = "total_violent_pop_crime_estimate")
#                           )
#                         )
#                         ,
#                         
#                         mainPanel(
#                           leafletOutput("theMap", height = 900)
#                         )
#                     
#                     )
#               )
#            ),
#            
#            # Page for something else in the future
#            tabPanel("Another Page",
#                     fluidRow("This is another page")
#                     )
# )