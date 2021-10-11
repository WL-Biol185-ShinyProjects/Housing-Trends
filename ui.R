library(shiny)

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