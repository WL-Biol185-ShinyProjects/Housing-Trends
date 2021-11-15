library(leaflet)
library(rgdal)
library(tidyverse)

source("Data_Prep/MedianAgeEstimate_cleanup.R")

# Reset json
# geo <- originalGeo


geo <- readOGR("Data/counties.json")

yearToUse <- 2016

# Filtering by year to show on map
# We should replace this with input from something like a dropdown with the years in the decade to choose from
to_join <- merged_medianage_data %>%
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
bins <- c(0,20, 30,40, 50, 60, 70, 80, Inf)
pal <- colorBin("YlOrRd", domain = geo$median_age, na.color = "transparent", bins = bins)

# Labels to show on hover
labels <- sprintf(
  "<strong>%s</strong><br/>%g people",
  geo$NAME, geo$median_age
) %>% lapply(htmltools::HTML)


# Final leaflet map to output
leaflet(geo) %>% 
  setView(-79.442778, 37.783889, 8) %>%
  addPolygons(fillColor = ~pal(geo$median_age),color = "white", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5, label = labels) %>%
  addLegend( pal=pal, values=geo$median_age, opacity=0.9, title = "Median Age", position = "bottomleft" )



