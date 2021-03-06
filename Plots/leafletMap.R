allLeafletMap <- function (originalGeo, yearToUse, dataToUse) {
  # Reset json
  geo <- originalGeo
  
  # Filtering by year to show on map
  # to_join <- pop_est %>%
  #   filter(year == yearToUse)

  # Left join our data into the geo json's data
  newData  <- lapply(list(yearly_crime_est, yearly_local_enrollment,merged_medianage_data, pop_est, clean_dcohu), function (x) filter(x, year == yearToUse)) %>%
    reduce(left_join, by = c("county" = "county", 
                             "LSAD" = "LSAD"))
  
  newData <-left_join(geo@data, newData, by=c("NAME" = "county",
                                              "LSAD" = "LSAD"))
  
  # Replace with the joined version
  geo@data <- newData
  
  # Removing the polygons of non-VA states
  geo@polygons[which(geo@data$STATE != 51)] <- NULL
  
  # Removing non-VA data
  geo@data <- geo@data[geo@data$STATE == 51,]
  
  # Prepping colors for chloropleth
  # bins <- c(0,20000,30000,40000, 50000, Inf)
  # print(geo[[dataToUse]])
  #bins <- seq(min(geo[[dataToUse]], na.rm = TRUE), to = max(geo[[dataToUse]], na.rm = TRUE) * (4/5), by = max(geo[[dataToUse]], na.rm = TRUE) / 5)
  bins <- unique(quantile(geo[[dataToUse]],probs=seq.int(0,1, by=1/4), na.rm = TRUE))
  bins <- c(bins, Inf)
  
  palettes <- c("pop_estimate" = "YlOrRd",
                "median_age" = "YlGnBu",
                "enrollment_estimate" = "Blues",
                "total_violent_pop_crime_estimate" = "BuGn",
                "housing_units" = "Greys")
  
  pal <- colorBin(palettes[[dataToUse]], domain = geo[[dataToUse]], na.color = "transparent", bins = bins)
  
  # Labels to show on hover
  labels <- sprintf(
    "<strong>%s</strong><br/>%g people",
    geo$NAME, geo[[dataToUse]]
  ) %>% lapply(htmltools::HTML)
  
  
  # Final leaflet map to output
  leaflet(geo, options = leafletOptions(minZoom = 7)) %>% 
    setView(-79.442778, 37.783889, 8) %>%
    addPolygons(fillColor = ~pal(geo[[dataToUse]]),color = "white", weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5, label = labels) %>%
    addLegend( pal=pal, values=geo[[dataToUse]], opacity=0.9, title = "Legend", position = "bottomleft" ) %>%
    setMaxBounds( lng1 = -83.94011
                  , lat1 = 39.64454
                  , lng2 = -75.04414
                  , lat2 = 36)
}



# geo <- readOGR("Data/counties.json")
# allLeafletMap(geo, 2011, "median_age")
