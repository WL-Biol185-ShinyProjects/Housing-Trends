library(leaflet)
library(rgdal)
library(tidyverse)

source("Data_Prep/population_estimates_cleanup.R")
source("Data_Prep/DCOHU_data_cleanup.R")
source("Data_Prep/MedianAgeEstimate_cleanup.R")
source("Data_Prep/education_estimates_cleanup.R")
source("Data_Prep/crime_estimates_cleanup.R")

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
  bins <- c(0,20000,30000,40000, 50000, Inf)
  pal <- colorBin("YlOrRd", domain = geo[[dataToUse]], na.color = "transparent", bins = bins)
  
  # Labels to show on hover
  labels <- sprintf(
    "<strong>%s</strong><br/>%g people",
    geo$NAME, geo[[dataToUse]]
  ) %>% lapply(htmltools::HTML)
  
  
  # Final leaflet map to output
  leaflet(geo) %>% 
    setView(-79.442778, 37.783889, 8) %>%
    addPolygons(fillColor = ~pal(geo[[dataToUse]]),color = "white", weight = 1, smoothFactor = 0.5,
                opacity = 1.0, fillOpacity = 0.5, label = labels) %>%
    addLegend( pal=pal, values=geo[[dataToUse]], opacity=0.9, title = "Legend", position = "bottomleft" )
}


# geo <- readOGR("Data/counties.json")
# allLeafletMap(geo, 2011, "median_age")
