library(leaflet)
library(rgdal)
library(tidyverse)

#The race data needs its own separate map because it requires an additional drop down menu for the quantities of people in each race category
source("Data_Prep/Race_Demographics_cleanup.R")

