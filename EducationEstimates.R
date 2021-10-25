library(tidyverse)
library(rgdal)

#renaming variables
early_local_enrollment <- read.csv("~/Housing-Trends/Data/loc_enroll.csv")
late_local_enrollment <- read.csv("~/Housing-Trends/Data/loc_enroll2.csv")

#joindata 
local_enrollment <- left_join(early_local_enrollment, late_local_enrollment, by = "Locality", c="year")
local_enrollment <- local_enrollment[-c(135:136),] 

#note:many of the lists have counties AND cities
