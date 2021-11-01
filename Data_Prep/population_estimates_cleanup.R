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

# Remove unnecessary columns
tidy_pop_data$Census <- NULL
tidy_pop_data$`Estimates Base`<-NULL

# Remove unnecessary rows
tidy_pop_data <- tidy_pop_data[-c(1,135:140),] 

# Change first column name
colnames(tidy_pop_data)[1] <- "county"

#gathering data
pop_est <- gather(tidy_pop_data, key = "year", value = "pop_estimate", `2010`:`2019`)

# Remove . in the beginning of county names
pop_est$county <- sub('.', '', pop_est$county)

# Remove the ", Virginia" portion of the column
pop_est$county <- gsub(",\\s*\\w*$", "", pop_est$county)

# Get the last word - either city or County - and put in its own column
pop_est$LSAD <- word(pop_est$county, -1)

# Remove the LSAD since it has its own column
pop_est$county <- gsub("\\s*\\w*$", "", pop_est$county)
