library(readxl)
library(ggplot2)
library(tidyverse)
library(shiny)
library(sf)
library(leaflet)
library(rgdal)

#importing population data
tidy_pop_data <- read_excel("~/Housing-Trends/Data/Population Estimates/co-est2019-annres-51 (2).xlsx", 
                           skip = 3)
View(tidy_pop_data)

#tidy edits
tidy_pop_data$Census <- NULL
tidy_pop_data$`Estimates Base`<-NULL
tidy_pop_data <- tidy_pop_data[-c(1,135:140),] 
colnames(tidy_pop_data)[1] <- "county"
View(tidy_pop_data)

#gathering my data
yearly_pop_est <- gather(tidy_pop_data, key = "year", value = "pop_estimate", `2010`:`2019`)
View(yearly_pop_est)



ggplot(yearly_pop_est, aes(pop_estimate, year, color = pop_estimate)) + geom_point()
ggplot(yearly_pop_est, aes(county, estimate)) + geom_point()
ggplot(yearly_pop_est, aes(county, year, color = pop_estimate)) + geom_point()

#attempts to create map
#left join data structure on left and our data on the right// use by argument, reassign back to geo structure data
#-- THEN do leaflet to fill the polygons
