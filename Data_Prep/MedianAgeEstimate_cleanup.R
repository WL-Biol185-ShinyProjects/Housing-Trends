library(tidyverse)
library(readr)
library(dplyr)

#THIS IS THE 2011 DATASET FOR RACE
Census_2011_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2011_RaceEstimates_forVA.csv")
# add a new column that denotes the year to dataframe
Census_2011_RaceEstimates_forVA$Year <- 2011
#make all the spaces in the column name a period instead to be readable when adding to leaflet map
names(Census_2011_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2011_RaceEstimates_forVA))
#Change first column name
colnames(Census_2011_RaceEstimates_forVA)[1] <- "County"
#Gathering data
gathered_race_estimates <- gather(Census_2011_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates$LSAD <- word(gathered_race_estimates$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates$County <- gsub("\\s*\\w*$", "", gathered_race_estimates$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2011 <- gathered_race_estimates[!(gathered_race_estimates$LSAD =="Virginia"),]










#THIS IS MERGING ALL THE DATASETS TOGETHER
merged_race_data <- rbind(gathered_race_estimate_2011,
                          gathered_race_estimate_2012,
                          gathered_race_estimate_2013,
                          gathered_race_estimate_2014,
                          gathered_race_estimate_2015,
                          gathered_race_estimate_2016,
                          gathered_race_estimate_2017,
                          gathered_race_estimate_2018,
                          gathered_race_estimate_2019)
view(merged_race_data)