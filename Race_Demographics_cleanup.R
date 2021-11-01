library(tidyverse)
library(readr)
library(dplyr)

Census_2012_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2012_RaceEstimates_forVA.csv")

# remove rows where all values are NA:
Census_2012_RaceEstimates_forVA %>% filter_all(any_vars(!is.na(.)))
Census_2012_RaceEstimates_forVA %>% filter_all(any_vars(complete.cases(.)))
View(Census_2012_RaceEstimates_forVA)

Census_2014_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2014_RaceEstimates_forVA.csv")

#remove columns where all values are NA
Census_2014_RaceEstimates_forVA= select(Census_2014_RaceEstimates_forVA, -8)
View(Census_2014_RaceEstimates_forVA)

merged_race_data <- rbind("Census_2011_RaceEstimates_forVA,
               Census_2012_RaceEstimates_forVA,
               Census_2013_RaceEstimates_forVA,
               Census_2014_RaceEstimates_forVA,
               Census_2015_RaceEstimates_forVA,
               Census_2016_RaceEstimates_forVA,
               Census_2017_RaceEstimates_forVA,
               Census_2018_RaceEstimates_forVA,
               Census_2019_RaceEstimates_forVA_0")

