library(shiny)
library(leaflet)
library(shinydashboard)

#Source data here
source("Data_Prep/Race_Demographics_cleanup.R")
source("Data_Prep/crime_estimates_cleanup.R")
source("Data_Prep/subsidized_housing_cleanup.R")

dashboardPage(
  dashboardHeader (title = "Exploring Housing Insecurity Related Factors in Virginia", titleWidth = 600), skin = "green",
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Main Map", tabName = "maps", icon = icon("map")),
      menuItem("Explore", tabName = "explore", icon = icon("magic")),
      menuItem("Race and Ethnicity", tabName = "race_in_va", icon = icon("clock")),
      menuItem("Income", tabName = "income_and_race", icon = icon("money")),
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
                div(class="banner",
                    h2(class="main-title",
                       "HOUSING INSECURITY TRENDS PROJECT"
                       ),
                    p(class="main-description",
                      "Insight into factors surrounding housing insecurity in VA."
                      )
                    )
              ),
              fluidRow(
                div(class="page-section",
                  h2(class = "title",
                    "BACKGROUND"
                    ),
              p(class = "description",
                "According to the U.S. Department of Housing and Urban Development, housing insecurity is a  a multifaceted term that includes a wide variety of housing problems people may experience, including loss of housing, affordability, safety, quality, and insecurity."
                 )
              )
              ),
              fluidRow(
                div(class="page-section",
                    h2(class="title",
                       "What you'll find here"
                    ),
                    p(class="description",
                      "An interactive tool that helps you explore how housing insecurity-related factors change over time in Virginia. You can find information about population demographics,income,education attainment,number of occupied housing units, as well as homelessness and see how they may impact housing insecurity in Virginia's counties."
                    )
                )
              )
              ),
      # All Maps
      tabItem(tabName="maps",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("map"), "Main Map"), 
                    p(class="plot-description", "This map explores the changes in a variety of population demographic variables over the previous decade, in the state of Virginia. Factors such as population size,median age, education enrollment, and occupied housing units are displayed.")
                   )
              ),
              # Value boxes showing data by year
              fluidRow(

                valueBoxOutput("perCapitaIncomeBox"),
                valueBoxOutput("popEstimatesBox"),
                valueBoxOutput("crimeEstimatesBox"), 
                valueBoxOutput("homelessEstimatesBox")  
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
                                "Population Size" = "pop_estimate",
                                "Median Age" = "median_age",
                                "Education Enrollment" = "enrollment_estimate",
                                "Total Crime " = "total_violent_pop_crime_estimate",
                                "Occupied Housing Units" = "housing_units")
                              ),
                  h2("Variable Descriptions"),
                  shiny::tags$ul(
                    shiny::tags$li(strong("Population Size: "), "An estimate of total population per county."),
                    shiny::tags$li(strong("Median Age: "), "The median age of the given population."),
                    shiny::tags$li(strong("Education Enrollment: "), "Number of students enrolled in higher education."),
                    shiny::tags$li(strong("Total Crime: "), "Total Violent and Property Crimes per county."),
                    shiny::tags$li(strong("Occupied Housing Units: "), "A house, an apartment, a mobile home, a group of rooms, or a single room that is occupied with a person or group of persons.")
                  )
                  )
                )
              ),
      #Explore Page
      tabItem(tabName="explore",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("magic"), "Explore"), 
                    p(class="plot-description", "")
                )
              ),
              fluidRow(
                h2("Crime Counts in Virginia"),
                box(status = "primary", width = 8, plotOutput("crimePlot")),
                box(
                  title = "Controls",
                  status = "warning",
                  width = 4,
                  selectInput("crimeCounty", 
                              "County",
                              multiple = TRUE,
                              selected = "Accomack",
                              choices = unique(yearly_crime_est$county[!is.na(yearly_crime_est$total_violent_pop_crime_estimate)]))
                  
                )
              ),
              fluidRow(

                h2("Election Results in Virginia from 2012 - 2016"),
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
      # Race and Ethnicity Page
      tabItem(tabName="race_in_va",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("clock"), "Race and Ethnicity"), 
                    p(class="plot-description", "On this page, you can find visualizations of the population distribution by race over time at the state & county level.")
                )
              ),
              fluidRow(
                h2("Population Distribution (VA)"),
                box(status = "primary", width = 12, plotOutput("racePlot")),
                h2("Population Distribution (County)"),
                box(status = "primary", width = 8, plotOutput("racePlotII")),
                box(
                  title = "Controls",
                  status = "warning",
                  width = 4,
                  selectInput("county", "County", choices = unique(merged_race_data$county))
          
                )
              )
      ),
      # Income Page
      tabItem(tabName ="income_and_race",
              fluidRow(
                box(width = 12, 
                    h2(class="title", icon("money-bill-wave"), " Income"), 
                    p(class="plot-description", " On this page, you can find graphics of variables related to income such as subsidized housing rates per county, homelessness rates, and average income over time.")
                )
              ),
              fluidRow(
                box(status = "primary", width = 6, 
                    h2("Inflation Adjusted Per Capita Income in Virginia"),
                    plotOutput("IncomePerCapita")),
                box(status = "primary", width = 6, 
                    h2("Inflation Adjusted Average Income by Race"),
                    plotOutput("Average_Income_Plot")
              )),
              fluidRow(
                h2("Total Subsidized Housing by County"),
                box(status = "primary", width = 8, plotOutput("subsidizedPlot")),
                box(width = 4,
                  selectInput("subCounty", 
                              "County",
                              multiple = TRUE,
                              selected = "Accomack",
                              choices = unique(yearly_subsidized_housing$county[!is.na(yearly_subsidized_housing$total_subsidized_housing)]))
                )
              ),
              
              fluidRow(
                h2("Homelessness in Virginia from 2010-2019"),
                box(status = "primary", width = 12, plotOutput("homelessness"))
                )
              ),
      # About Page
      tabItem(tabName="about",
              fluidRow(
                div(class="mini-banner about-banner",
                    h2("ABOUT THIS PROJECT"))
              ),
              
              fluidRow(
                div(class="page-section",
                    fluidRow(
                      h2(class="title", icon("users"), "The Team")
                    ),
                    fluidRow(class="cards-container",
                             column(8, class="cards",
                                    div(class="card",
                                        img(src='images/Betelihim.jpg', alt='Avatar', style='width:100%'),
                                        div(class="container",
                                            h4(class="name", strong("Betelihim Haile")),
                                            p(class="year", "Class of 2022"),
                                            p(strong("Major:"), "Neuroscience")
                                        )),
                                    div(class="card",
                                        img(src='images/Carolina.jpg', alt='Avatar', style='width:100%'),
                                        div(class="container",
                                            h4(class="name", strong("Carolina Rubio Regalado")),
                                            p(class="year", "Class of 2022"),
                                            p(strong("Major:"), "Sociology & Anthropology")
                                        )),
                                    div(class="card",
                                        img(src='images/Yoseph.jpg', alt='Avatar', style='width:100%'),
                                        div(class="container",
                                            h4(class="name", strong("Yoseph Tamene")),
                                            p(class="year", "Class of 2022"),
                                            p(strong("Major:"), "Computer Science")
                                        )))
                    ))
                )
              ,
              fluidRow(
                div(class="page-section",
                    h2(class="title", icon("table"), "The Data")),
                div(class="references",
                  shiny::tags$ul(
                    shiny::tags$li("“Datasets: HUD USER.” DATASETS | HUD USER, https://www.huduser.gov/portal/pdrdatas_landing.html. "),
                    shiny::tags$li("“FBI Crime Data .” Social Explorer, https://www.socialexplorer.com/tables/FBI19/R12986569.  "),
                    shiny::tags$li("Education, Virginia Department of. “Data for Researchers &amp; Developers.” VDOE:: Statistics and Reports; Data for Researchers &amp; Developers, https://www.doe.virginia.gov/statistics_reports/research_data/index.shtml."),
                    shiny::tags$li("MIT Election Data and Science Lab, 2017, “U.S. President 1976–2020”, https://doi.org/10.7910/DVN/42MVDX, Harvard Dataverse, V6, UNF:6:4KoNz9KgTkXy0ZBxJ9ZkOw== [fileUNF]"),
                    shiny::tags$li("“Mean Income in the Past 12 Months .” Explore Census Data, https://https://data.census.gov/cedsci/table?q=per%20capita%20income%20per%20county%20in%20virginia&tid=ACSST1Y2019.S1902."),
                    shiny::tags$li("“Per Capita Income in the Past 12 Months .” Explore Census Data, https://data.census.gov/cedsci/table?q=per+capita+income+in+Virginia&amp;tid=ACSDT1Y2019.B19301. "),
                    shiny::tags$li("“Virginia Population Estimates.” Weldon Cooper Center for Public Service, https://demographics.coopercenter.org/virginia-population-estimates. ")
                    ),
                    
                )
                
              )
      )
    )
    
  )
)