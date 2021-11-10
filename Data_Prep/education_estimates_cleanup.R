library(tidyverse)
library(rgdal)

#enrollment to postsecondary education

#renaming variables
early_local_enrollment <- read.csv("~/Housing-Trends/Data/loc_enroll.csv")
late_local_enrollment <- read.csv("~/Housing-Trends/Data/loc_enroll2.csv")

#joindata 
local_enrollment <- left_join(early_local_enrollment, late_local_enrollment, by = "Locality", c="year")

#eliminate unexessary info
local_enrollment <- local_enrollment[-c(135:136),]

#Tidying info
colnames(local_enrollment)[2:11] <- 2010:2019
colnames(local_enrollment)[1] <- "county"

#eliminate the parenthesis with info inside the column
local_enrollment$county <- gsub("\\s*\\([^\\)]+\\)\\s*$","",as.character(local_enrollment$county))

#Create the LSAD column and remove LSAD from the county column
local_enrollment$LSAD <- word(local_enrollment$county, -1)

#include only county name
local_enrollment$county <- gsub("\\s*\\w*$", "", local_enrollment$county)

#gathering my data
yearly_local_enrollment <- gather(local_enrollment, key = "year", value = "enrollment_estimate", `2010`:`2019`)
yearly_local_enrollment$enrollment_estimate <- as.numeric(gsub(",","",yearly_local_enrollment$enrollment_estimate))
View(yearly_local_enrollment)

