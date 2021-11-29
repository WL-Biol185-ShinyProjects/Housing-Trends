library(tidyverse)
library(readr)
library(dplyr)

#Import and Eliminate unecessary columns
# voting_data <- read_csv("Data/countypres_2000-2020.csv",
#                                  col_types = cols(state = col_skip(), county_fips = col_skip(), 
#                                                   office = col_skip(), candidatevotes = col_skip(), 
#                                                   totalvotes = col_skip(), version = col_skip(),
#                                                   mode = col_skip())) %>%
#   filter(state_po == "VA")
# %>%
#   rename(county = county_name)

election_data <- read_csv("Data/election data.csv", 
                          col_types = cols(Democrat = col_skip(), 
                                           Other = col_skip(), Republican = col_skip(), 
                                           state = col_skip(), stateID = col_skip())) %>%
  filter(state_po == "VA")
# colnames(voting_data)[2] <- "county"

election_data$state_po <- NULL


election_data$LSAD <- ifelse(election_data$city == 1, "city", "County")

# County and City column for LSAD, remove of city respectfully in the county column
# voting_data$LSAD <- c("County", "city") [as.numeric (grepl(" CITY", voting_data$county)) + 1 ]

#Eliminating the pattern of city
# grepl (" CITY",voting_data$county)

# voting_data$county <- gsub(" CITY", "", voting_data$county)



