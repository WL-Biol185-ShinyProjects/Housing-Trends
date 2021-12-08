electionMap <- function (originalGeo, yearToUse) {
  # Reset json
  geo <- originalGeo
  
  # Filtering by year to show on map
  to_join <- election_data %>%
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
  
  
  
  # Prepping colors
  pal <- colorFactor(palette = c("red", "blue"), levels = c("Republican", "Democrat"))
  
  # Labels to show on hover
  labels <- paste(htmltools::strong("County:"), 
                  geo@data$NAME , htmltools::br(),
                  htmltools::strong("Winning Party: "),
                  geo@data$party, htmltools::br(),
                  htmltools::strong("Winning Candidate:"), 
                  geo@data$winner, htmltools::br())
  
  
  # Final leaflet map to output
  leaflet(geo, options = leafletOptions(minZoom = 7)) %>% 
    setView(-79.442778, 37.783889, 8) %>%
    addPolygons(fillColor = ~pal(geo$party), color = ~pal(geo$party), weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5, popup = labels) %>%
    setMaxBounds( lng1 = -83.94011
                  , lat1 = 39.64454
                  , lng2 = -75.04414
                  , lat2 = 36)
}


# geo <- readOGR("Data/counties.json")
# electionMap(geo, 2012)
