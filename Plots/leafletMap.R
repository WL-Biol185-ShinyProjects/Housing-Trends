library(leaflet)
library(rgdal)
library(tidyverse)

source("DCOHU_data_cleanup.R")

geo <- readOGR("Data/counties.json")

# Filtering by year to show on map
# We should replace this with input from something like a dropdown with the years in the decade to choose from
to_join <- clean_dcohu %>%
  filter(year == 2010)

# Left join our data into the geo json's data
newData  <- left_join(geo@data, to_join, by = c("NAME" = "county", 
                                               "LSAD" = "LSAD"))

# Replace with the joined version
geo@data <- newData

# Prepping colors for chloropleth
bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("YlOrRd", domain = geo$units, bins = bins)

# Labels to show on hover
labels <- sprintf(
  "<strong>%s</strong><br/>%g units",
  geo$NAME, geo$units
) %>% lapply(htmltools::HTML)

# Final leaflet map to output
leaflet(geo) %>% 
  setView(-103.483330, 38.712046, 4) %>% # Just showing US for now
  addPolygons(fillColor = ~pal(geo$units),color = "white", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5, label = labels)

# Below not used for now
leafletMap <- leaflet(geo) %>% 
  setView(lng = -79.442778, lat = 37.783889, zoom = 12) %>% 
  addPolygons()
