library(tidyverse)
library(readr)
library(dplyr)


#THIS IS THE 2011 DATASET FOR RACE
Census_2011_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2011_RaceEstimates_forVA.csv")
#remove columns where all values are NA
Census_2011_RaceEstimates_forVA = select(Census_2011_RaceEstimates_forVA, -8)
# add a new column that denotes the year to dataframe
Census_2011_RaceEstimates_forVA$Year <- 2011
#make all the spaces in the column name a period instead to be readable when adding to leaflet map
names(Census_2011_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2011_RaceEstimates_forVA))
#Change first column name
colnames(Census_2011_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2011_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates <- gather(Census_2011_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates$LSAD <- word(gathered_race_estimates$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates$County <- gsub("\\s*\\w*$", "", gathered_race_estimates$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2011 <- gathered_race_estimates[!(gathered_race_estimates$LSAD =="Virginia"),]



#THIS IS THE 2012 DATASET FOR RACE
Census_2012_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2012_RaceEstimates_forVA.csv")
# remove rows where all values are NA:
Census_2012_RaceEstimates_forVA %>% filter_all(any_vars(!is.na(.)))
Census_2012_RaceEstimates_forVA %>% filter_all(any_vars(complete.cases(.)))
# add a new column that denotes the year to dataframe
Census_2012_RaceEstimates_forVA$Year <- 2012
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2012_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2012_RaceEstimates_forVA))
#Change first column name
colnames(Census_2012_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2012_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2012 <- gather(Census_2012_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2012$LSAD <- word(gathered_race_estimates_2012$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2012$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2012$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2012 <- gathered_race_estimates_2012[!(gathered_race_estimates_2012$LSAD =="Virginia"),]



#THIS IS THE 2013 DATASET FOR RACE
Census_2013_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2012_RaceEstimates_forVA.csv")
#remove columns where all values are NA
Census_2013_RaceEstimates_forVA= select(Census_2013_RaceEstimates_forVA, -8)
# add a new column that denotes the year to data frame
Census_2013_RaceEstimates_forVA$Year <- 2013
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2013_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2013_RaceEstimates_forVA))
#Change first column name
colnames(Census_2013_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2013_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2013 <- gather(Census_2013_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2013$LSAD <- word(gathered_race_estimates_2013$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2013$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2013$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2013 <- gathered_race_estimates_2013[!(gathered_race_estimates_2013$LSAD =="Virginia"),]

#THIS IS THE 2014 DATASET FOR RACE
Census_2014_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2014_RaceEstimates_forVA.csv")
#remove columns where all values are NA 
Census_2014_RaceEstimates_forVA= select(Census_2014_RaceEstimates_forVA, -8)
# add a new column that denotes the year to data frame
Census_2014_RaceEstimates_forVA$Year <- 2014
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2014_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2014_RaceEstimates_forVA))
#Change first column name
colnames(Census_2014_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2014_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2014 <- gather(Census_2014_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2014$LSAD <- word(gathered_race_estimates_2014$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2014$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2014$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2014 <- gathered_race_estimates_2014[!(gathered_race_estimates_2014$LSAD =="Virginia"),]


#THIS IS THE 2015 DATASET FOR RACE
Census_2015_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2015_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2015_RaceEstimates_forVA$Year <- 2015
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2015_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2015_RaceEstimates_forVA))
#Change first column name
colnames(Census_2015_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2015_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2015 <- gather(Census_2015_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2015$LSAD <- word(gathered_race_estimates_2015$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2015$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2015$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2015 <- gathered_race_estimates_2015[!(gathered_race_estimates_2015$LSAD =="Virginia"),]



#THIS IS THE 2016 DATASET FOR RACE
Census_2016_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2016_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2016_RaceEstimates_forVA$Year <- 2016
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2016_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2016_RaceEstimates_forVA))
#Change first column name
colnames(Census_2016_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2016_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2016 <- gather(Census_2016_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2016$LSAD <- word(gathered_race_estimates_2016$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2016$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2016$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2016 <- gathered_race_estimates_2016[!(gathered_race_estimates_2016$LSAD =="Virginia"),]




#THIS IS THE 2017 DATASET FOR RACE
Census_2017_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2017_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2017_RaceEstimates_forVA$Year <- 2017
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2017_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2017_RaceEstimates_forVA))
#Change first column name
colnames(Census_2017_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2017_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2017 <- gather(Census_2017_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2017$LSAD <- word(gathered_race_estimates_2017$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2017$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2017$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2017 <- gathered_race_estimates_2017[!(gathered_race_estimates_2017$LSAD =="Virginia"),]




#THIS IS THE 2018 DATASET FOR RACE
Census_2018_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2018_RaceEstimates_forVA.csv")
# add a new column that denotes the year to data frame
Census_2018_RaceEstimates_forVA$Year <- 2018
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2018_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2018_RaceEstimates_forVA))
#Change first column name
colnames(Census_2018_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2018_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2018 <- gather(Census_2018_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2018$LSAD <- word(gathered_race_estimates_2018$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2018$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2018$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2018 <- gathered_race_estimates_2018[!(gathered_race_estimates_2018$LSAD =="Virginia"),]



#THIS IS THE 2019 DATASET FOR RACE
Census_2019_RaceEstimates_forVA <- read_csv("Data/Census Race Estimates for VA/Census_2019_RaceEstimates_forVA_0.csv")
# add a new column that denotes the year to data frame
Census_2019_RaceEstimates_forVA$Year <- 2019
#make all the spaces in the column a period instead to be readable when adding to leaflet map
names(Census_2019_RaceEstimates_forVA) <- gsub(" ", ".", names(Census_2019_RaceEstimates_forVA))
#Change first column name
colnames(Census_2019_RaceEstimates_forVA)[1] <- "County"
#Remove the "Total population" Column
Census_2019_RaceEstimates_forVA$Total.Population <- NULL
#Gathering data
gathered_race_estimates_2019 <- gather(Census_2019_RaceEstimates_forVA, key = "Race", value = "Race_estimate", `White.Alone`,`African.American.Alone`,`Asian.Alone`,`Other.Races.Alone`,`Two.or.more.races`)
#Get the last word - either city or County - and put in its own column
gathered_race_estimates_2019$LSAD <- word(gathered_race_estimates_2019$County, -1)
#Remove the LSAD since it has its own column
gathered_race_estimates_2019$County <- gsub("\\s*\\w*$", "", gathered_race_estimates_2019$County)
#Remove the word Virginia from LSAD column
gathered_race_estimate_2019 <- gathered_race_estimates_2019[!(gathered_race_estimates_2019$LSAD =="Virginia"),]

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


