library(leaflet)
library(rgdal)
library(tidyverse)

source("Data_Prep/DCOHU_data_cleanup.R")

leafletMap <- function (originalGeo, yearToUse) {
  # Reset json
  geo <- originalGeo
  
  # Filtering by year to show on map
  # We should replace this with input from something like a dropdown with the years in the decade to choose from
  to_join <- clean_dcohu %>%
    filter(year == yearToUse)
  
  # Left join our data into the geo json's data
  newData  <- left_join(geo@data, to_join, by = c("NAME" = "county", 
                                                  "LSAD" = "LSAD"))
  
  # Replace with the joined version
  geo@data <- newData
  
  # Removing the polygons of non-VA states
  geo@polygons[which(geo@data$STATE != 51)] <- NULL
  
  # Removing non-VA data
  geo@data <- geo@data[geo@data$STATE == 51,]
  
  # Prepping colors for chloropleth
  bins <- c(0,20000,30000,40000, 50000, Inf)
  pal <- colorBin("YlOrBr", domain = geo$units, na.color = "transparent", bins = bins)
  
  # Labels to show on hover
  labels <- sprintf(
    "<strong>%s</strong><br/>%g units",
    geo$NAME, geo$units
  ) %>% lapply(htmltools::HTML)
  
  
  # Final leaflet map to output
  leaflet(geo) %>% 
    setView(-79.442778, 37.783889, 8) %>%
    addPolygons(fillColor = ~pal(geo$units),color = "white", weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5, label = labels) %>%
    addLegend( pal=pal, values=geo$units, opacity=0.9, title = "Number of Units", position = "bottomleft" )
}

# geo <- readOGR("Data/counties.json")
# leafletMap(geo, 2015)
