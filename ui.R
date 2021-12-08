library(shiny)
library(leaflet)
library(shinydashboard)

#Source data here
source("Data_Prep/Race_Demographics_cleanup.R")

dashboardPage(
  dashboardHeader (title = "An Analysis of Housing Trends in Virginia from 2010-2019", titleWidth = 600), skin = "green",
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Main Map", tabName = "maps", icon = icon("map")),
      menuItem("Race and Ethnicity", tabName = "race_in_va", icon = icon("clock")),
      menuItem("Income and Race", tabName = "income_and_race", icon = icon("money")),
      menuItem("Education Patterns", tabName = "education_in_va", icon = icon("university")), 
      menuItem("Voting Patterns", tabName = "voting_in_va", icon = icon("poll")),
      menuItem("About", tabName = "about", icon = icon("info-circle"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    tabItems(
      #Home Page
      tabItem(tabName="home",
              fluidRow(
                HTML("
                                     
                     <div class='banner'>
                      <h2 class='main-title'>HOUSING TRENDS PROJECT</h2>
                      <p class='main-description'>Insight into factors affecting housing in VA.</p>
                     </div>
                     ")
              ),
              fluidRow(
                HTML("
                     <section class='page-section'>
                      <h2 class='title'>What you'll find here</h2>
                      <p class='description'>An interactive tool that helps you explore how housing-related factors change over time in Virginia. You can find information about crime, race demographics, election data, as well as education and see how they affect housing in Virginia's counties.</p>
                     </section>
                     ")
              )
              ),
      # All Maps
      tabItem(tabName="maps",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("map"), "Main Map"), 
                    p(class="plot-description", "This map explores the changes in a variety of housing demographic variables over the previous decade, in the state of Virginia. Factors such as race, education, income, voting, homelessness, etc are displayed over time in the counties.")
                    )
              ),
              # Value boxes showing data by year
              fluidRow(
                valueBoxOutput("perCapitaIncomeBox")
              ),
              # Main Map
              fluidRow(
                box(status = "primary", width = 8, leafletOutput("theMap", height = 900)),
                
                box(
                  title = "Controls",
                  status = "warning",
                  width = 4,
                  sliderInput(
                    "year", label = "Year:", sep="", animate=TRUE,
                    min = 2010, value = 2015, max = 2019,
                   ),
                  selectInput("variable", "Variable:",
                              c(
                                "Population Estimates" = "pop_estimate",
                                "Median Age Estimates" = "median_age",
                                "Education Enrollment" = "enrollment_estimate",
                                "Crime Estimates" = "total_violent_pop_crime_estimate",
                                "Occupied Housing Units" = "housing_units")
                              )
                  )
                )
              ),
      # Bar plot of Race Across Time
      tabItem(tabName="race_in_va",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("clock"), "Race and Ethnicity"), 
                    p(class="plot-description", "On this page, you can find visualizations showing how the number of people belonging to the various races change over time - both at the state & county level.")
                )
              ),
              fluidRow(
                h2("Population Distribution by Race in Virginia"),
                box(status = "primary", width = 12, plotOutput("racePlot")),
                h2("Population Distribution by Race by County"),
                box(status = "primary", width = 8, plotOutput("racePlotII")),
                box(
                  title = "Controls",
                  status = "warning",
                  width = 4,
                  selectInput("county", "County", choices = unique(merged_race_data$county))
          
                )
              )
      ),
      # Income Graphs
      tabItem(tabName ="income_and_race",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("money-bill-wave"), " Income and Race"), 
                    p(class="plot-description", "")
                )
              ),
              fluidRow(
                h2("Income Per Capita in VA"),
                box(status = "primary", width = 12, plotOutput("IncomePerCapita"))
              ),
              fluidRow(
                h2("Homelessness in Virginia Overtime"),
                box(status = "primary", width = 12, plotOutput("homelessness"))
                )),
      
      # Election Map
      tabItem(tabName="voting_in_va",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("poll"), "Voting Patterns"), 
                    p(class="plot-description", "Below is a map showing election results for all of Virginia's counties. You can pick years between 2000 and 2016 and see which candidate won in each county.")
                )
              ),
              fluidRow(
                h2("Election Results in VA from 2012 - 2016"),
                box(status = "primary", width = 8, leafletOutput("electionMap", height = 900)),
                
                box(
                  title = "Controls",
                  status = "warning",
                  width = 4,
                  sliderInput(
                    "electionYear", label = "Year:", sep="", animate=TRUE,
                    min = 2000, value = 2016, max = 2016, step = 4
                  )
                )
              )
      ),
      # About Page
      tabItem(tabName="about",
              fluidRow(
                HTML("           
                     <div class='mini-banner'>
                      <h2 class=''>ABOUT THIS PROJECT</h2>
                     </div>
                     ")
              ),
              fluidRow(
                h2(class="title", icon("users"), "The Team")
              ),
              fluidRow(class="cards-container",
                       column(6, class="cards",
                              HTML("
                     <div class='card'>
                      <img src='images/Betelihim.jpg' alt='Avatar' style='width:100%'>
                      <div class='container'>
                        <h4 class='name'><b>Betelihim Haile</b></h4>
                        <p class='year'>Class of 2022</p>
                        <p><b>Major: </b>Neuroscience</p>
                      </div>
                    </div>
                     "),
                              HTML("
                     <div class='card'>
                      <img src='images/Carolina.jpg' alt='Avatar' style='width:100%'>
                      <div class='container'>
                        <h4 class='name'><b>Carolina Rubio Regalado</b></h4>
                        <p class='year'>Class of 2022</p>
                        <p><b>Major: </b>Sociology &amp; Anthropology</p>
                      </div>
                    </div>
                     "),
                              HTML("
                     <div class='card'>
                      <img src='images/Yoseph.jpg' alt='Avatar' style='width:100%'>
                      <div class='container'>
                        <h4 class='name'><b>Yoseph Tamene</b></h4>
                        <p class='year'>Class of 2022</p>
                        <p><b>Major: </b>Computer Science</p>
                      </div>
                    </div>
                     ")))
              ,
              fluidRow(
                h2(class="title", icon("table"), "The Data")
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