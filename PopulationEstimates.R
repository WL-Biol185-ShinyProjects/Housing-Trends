library(readxl)
library(ggplot2)
library(tidyverse)

library(leaflet)
library(rgdal)

#importing population data
tidy_pop_data <- read_excel("~/Housing-Trends/co-est2019-annres-51 (2).xlsx", 
                           skip = 3)
View(tidy_pop_data)

#tidy edits
tidy_pop_data$Census <- NULL
tidy_pop_data$`Estimates Base`<-NULL
tidy_pop_data <- tidy_pop_data[-c(1,135:140),] 
colnames(tidy_pop_data)[1] <- "county"

yearly_pop_est <- gather(tidy_pop_data[1:11], key = "year", value = "index")

#Attempts to create map

geo <- readOGR("Data/counties.geo.json")

myTable <- read.csv(tidy_pop_data)

newData  <- left_join(geo@data, myTable, by("NAME" = "county"))
geo@data <- newData

leaflet(geo) %>% 
  addPolygons(color = "#444444", weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5)
