library(leaflet)
library(rgdal)
library(tidyverse)

source("DCOHU_data_cleanup.R")

geo <- readOGR("Data/counties.json")

# Filtering by year to show on map
# We should replace this with input from something like a dropdown with the years in the decade to choose from
to_join <- clean_dcohu %>%
  filter(year == 2010)

newData  <- left_join(geo@data, to_join, by = c("NAME" = "county", 
                                                    "LSAD" = "LSAD"))
geo@data <- newData

# Prepping colors for chloropleth
bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("YlOrRd", domain = geo$units, bins = bins)

labels <- sprintf(
  "<strong>%s</strong><br/>%g units",
  geo$NAME, geo$units
) %>% lapply(htmltools::HTML)

leaflet(geo) %>% 
  setView(-103.483330, 38.712046, 4) %>% # Just showing US for now
  addPolygons(fillColor = ~pal(geo$units),color = "white", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5, label = labels)

leafletMap <- leaflet(geo) %>% 
  setView(lng = -79.442778, lat = 37.783889, zoom = 12) %>% 
  addPolygons()
