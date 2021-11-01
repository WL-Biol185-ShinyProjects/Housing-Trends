library(tidyverse)
library(readr)
library(dplyr)

Census_2011_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2011_RaceEstimates_forVA.csv")
#remove columns where all values are NA
Census_2011_RaceEstimates_forVA = select(Census_2011_RaceEstimates_forVA, -8)
view(Census_2011_RaceEstimates_forVA)
# add a new column that denotes the year to dataframe
Census_2011_RaceEstimates_forVA$Year <- 2011
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2011_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2011_RaceEstimates_forVA))
view(Census_2011_RaceEstimates_forVA)

Census_2012_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2012_RaceEstimates_forVA.csv")
# remove rows where all values are NA:
Census_2012_RaceEstimates_forVA %>% filter_all(any_vars(!is.na(.)))
Census_2012_RaceEstimates_forVA %>% filter_all(any_vars(complete.cases(.)))
View(Census_2012_RaceEstimates_forVA)
# add a new column that denotes the year to dataframe
Census_2012_RaceEstimates_forVA$Year <- 2012
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2012_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2012_RaceEstimates_forVA))
view(Census_2012_RaceEstimates_forVA)

Census_2013_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2012_RaceEstimates_forVA.csv")
#remove columns where all values are NA
Census_2013_RaceEstimates_forVA= select(Census_2013_RaceEstimates_forVA, -8)
View(Census_2013_RaceEstimates_forVA)
# add a new column that denotes the year to data frame
Census_2013_RaceEstimates_forVA$Year <- 2013
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2013_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2013_RaceEstimates_forVA))
view(Census_2013_RaceEstimates_forVA)

Census_2014_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2014_RaceEstimates_forVA.csv")
#remove columns where all values are NA 
Census_2014_RaceEstimates_forVA= select(Census_2014_RaceEstimates_forVA, -8)
View(Census_2014_RaceEstimates_forVA)
# add a new column that denotes the year to data frame
Census_2014_RaceEstimates_forVA$Year <- 2014
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2014_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2014_RaceEstimates_forVA))
view(Census_2014_RaceEstimates_forVA)

Census_2015_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2015_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2015_RaceEstimates_forVA$Year <- 2015
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2015_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2015_RaceEstimates_forVA))
view(Census_2015_RaceEstimates_forVA)

Census_2016_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2016_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2016_RaceEstimates_forVA$Year <- 2016
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2016_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2016_RaceEstimates_forVA))
view(Census_2016_RaceEstimates_forVA)

Census_2017_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2017_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2017_RaceEstimates_forVA$Year <- 2017
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2017_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2017_RaceEstimates_forVA))
view(Census_2017_RaceEstimates_forVA)

Census_2018_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2018_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2018_RaceEstimates_forVA$Year <- 2018
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2018_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2018_RaceEstimates_forVA))
view(Census_2018_RaceEstimates_forVA)

Census_2019_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2019_RaceEstimates_forVA_0.csv")
# add a new column that denotes the year to data frame
Census_2019_RaceEstimates_forVA$Year <- 2019
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2011_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2011_RaceEstimates_forVA))
view(Census_2011_RaceEstimates_forVA)


merged_race_data <- rbind(Census_2011_RaceEstimates_forVA,
               Census_2012_RaceEstimates_forVA,
               Census_2013_RaceEstimates_forVA,
               Census_2014_RaceEstimates_forVA,
               Census_2015_RaceEstimates_forVA,
               Census_2016_RaceEstimates_forVA,
               Census_2017_RaceEstimates_forVA,
               Census_2018_RaceEstimates_forVA,
               Census_2019_RaceEstimates_forVA)
view(merged_race_data)


