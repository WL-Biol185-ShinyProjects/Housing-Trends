library(leaflet)
library(rgdal)
library(tidyverse)

source("DCOHU_data_cleanup.R")

geo <- readOGR("Data/counties.json")

newData  <- left_join(geo@data, clean_dcohu, by = c("NAME" = "county", 
                                                    "LSAD" = "LSAD"))
geo@data <- newData

bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
pal <- colorBin("YlOrRd", domain = geo@data$units, bins = bins)


leaflet(geo) %>% 
  setView(-103.483330, 38.712046, 4) %>% # Just showing US for now
  addPolygons(fillColor = ~pal(geo@data$units),color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5)

leafletMap <- leaflet(geo) %>% 
  setView(lng = -79.442778, lat = 37.783889, zoom = 12) %>% 
  addPolygons()
