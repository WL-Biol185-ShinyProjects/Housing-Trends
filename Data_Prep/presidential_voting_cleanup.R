library(tidyverse)
library(readr)
library(dplyr)

#Import and Eliminate unecessary columns
countypres_2000_2020 <- read_csv("Data/countypres_2000-2020.csv",
                                 col_types = cols(state = col_skip(), county_fips = col_skip(), 
                                                  office = col_skip(), candidatevotes = col_skip(), 
                                                  totalvotes = col_skip(), version = col_skip(),
                                                  mode = col_skip())) %>%
  rename("county" = "county_name") %>%
  filter(state_po == "VA", year == 2010:2020)

#Filter for Virginia
VAcountypres_2000_2020 <- countypres_2000_2020 %>% 
  filter(state_po=="VA", year== 2010:2020) 

VAcountypres_2000_2020$state_po <- NULL

#Eliminating the pattern of city
grepl (" CITY",VAcountypres_2000_2020$county)

#Ass County and City column for LSAD, remove of city repectfully in the county column
VAcountypres_2000_2020$LSAD <- c("County", "city") [as.numeric (grepl(" CITY", VAcountypres_2000_2020$county)) + 1 ]
VAcountypres_2000_2020$county <- gsub(" CITY", "", VAcountypres_2000_2020$county)
View(VAcountypres_2000_2020)



