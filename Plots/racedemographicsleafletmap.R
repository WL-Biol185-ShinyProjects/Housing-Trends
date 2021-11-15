library(leaflet)
library(rgdal)
library(tidyverse)

#The race data needs its own separate map because it requires an additional drop down menu for the quantities of people in each race category
source("Data_Prep/Race_Demographics_cleanup.R")

racedemographicsleafletmap <- function (originalGeo, yearToUse) {
  # Reset json
  geo <- originalGeo
  
  # Filtering by year to show on map
  # We should replace this with input from something like a dropdown with the years in the decade to choose from
  to_join <- merged_race_data %>%
    filter(year == yearToUse)
  
  # Left join our data into the geo json's data
  newData  <- left_join(geo@data, to_join, by = c("NAME" = "County", 
                                                  "LSAD" = "LSAD"))
  # Replace with the joined version
  geo@data <- newData
  
  # Removing the polygons of non-VA states
  geo@polygons[which(geo@data$STATE != 51)] <- NULL
  
  # Removing non-VA data
  geo@data <- geo@data[geo@data$STATE == 51,]
  
  # Prepping colors for chloropleth
  bins <- c(0,20000,30000,40000, 50000, Inf)
  pal <- colorBin("YlOrBr", domain = geo$Race, na.color = "transparent", bins = bins)
  
  # Labels to show on hover
  labels <- sprintf(
    "<strong>%s</strong><br/>%g units",
    geo$NAME, geo$Race_estimates
  ) %>% lapply(htmltools::HTML)
  
  
  # Final leaflet map to output
  leaflet(geo) %>% 
    setView(-79.442778, 37.783889, 8) %>%
    addPolygons(fillColor = ~pal(geo$Race_estimate),color = "white", weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5, label = labels) %>%
    addLegend( pal=pal, values=geo$Race_estimate, opacity=0.9, title = "Race", position = "bottomleft" )
}

# geo <- readOGR("Data/counties.json")
# racedemographicsleafletmap(geo, 2015)

