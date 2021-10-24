library(leaflet)
library(rgdal)

countyGEO <- readOGR("Data/counties.geo.json")



leafletMap <- leaflet(countyGEO) %>% 
  setView(lng = -79.442778, lat = 37.783889, zoom = 12) %>% 
  addPolygons()
