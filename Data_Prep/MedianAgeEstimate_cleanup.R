library(tidyverse)
library(readr)
library(dplyr)

#THIS IS THE 2011 DATASET FOR MEDIAN AGE
Census_2011_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2011_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2011_RaceEstimates_forVA$year <- 2011
#Change first column name
colnames(Census_2011_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2011_MedianAgeEstimates_forVA$LSAD <- word(Census_2011_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2011_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2011_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2011 <-Census_2011_MedianAgeEstimates_forVA[!(Census_2011_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2011) <- gsub(" ", ".", names(median_age_estimate_2011))
#Gathering data by including a sex column
gathered_medianage_estimate_2011 <- gather(median_age_estimate_2011, key = "Sex", value = "median_age", `Male`,`Both.sexes`, `Female`)
view(gathered_medianage_estimate_2011)


#THIS IS THE 2012 DATASET FOR MEDIAN AGE
Census_2012_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2012_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2012_RaceEstimates_forVA$year <- 2012
#Change first column name
colnames(Census_2012_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2012_MedianAgeEstimates_forVA$LSAD <- word(Census_2012_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2012_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2012_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2012 <-Census_2012_MedianAgeEstimates_forVA[!(Census_2012_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2012) <- gsub(" ", ".", names(median_age_estimate_2012))
#Gathering data by including a sex column
gathered_medianage_estimate_2012 <- gather(median_age_estimate_2012, key = "Sex", value = "median_age", `Male`,`Both.sexes`, `Female`)
view(gathered_medianage_estimate_2012)

#THIS IS THE 2013 DATASET FOR MEDIAN AGE
Census_2013_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2013_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2013_RaceEstimates_forVA$year <- 2013
#Change first column name
colnames(Census_2013_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2013_MedianAgeEstimates_forVA$LSAD <- word(Census_2013_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2013_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2013_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2013 <-Census_2013_MedianAgeEstimates_forVA[!(Census_2013_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2013) <- gsub(" ", ".", names(median_age_estimate_2013))
#Gathering data by including a sex column
gathered_medianage_estimate_2013 <- gather(median_age_estimate_2013, key = "Sex", value = "median_age", `Male`,`Both.sexes`, `Female`)
view(gathered_medianage_estimate_2013)

#THIS IS THE 2014 DATASET FOR MEDIAN AGE
Census_2014_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2014_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2014_RaceEstimates_forVA$year <- 2014
#Change first column name
colnames(Census_2014_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2014_MedianAgeEstimates_forVA$LSAD <- word(Census_2014_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2014_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2014_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2014 <-Census_2014_MedianAgeEstimates_forVA[!(Census_2014_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2014) <- gsub(" ", ".", names(median_age_estimate_2014))
#Gathering data by including a sex column
gathered_medianage_estimate_2014 <- gather(median_age_estimate_2014, key = "Sex", value = "median_age", `Male`,`Both.sexes`, `Female`)
view(gathered_medianage_estimate_2014)

#THIS IS THE 2015 DATASET FOR MEDIAN AGE
Census_2015_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2015_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2015_RaceEstimates_forVA$year <- 2015
#Change first column name
colnames(Census_2015_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2015_MedianAgeEstimates_forVA$LSAD <- word(Census_2015_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2015_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2015_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2015 <-Census_2015_MedianAgeEstimates_forVA[!(Census_2015_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2015) <- gsub(" ", ".", names(median_age_estimate_2015))
#Gathering data by including a sex column
gathered_medianage_estimate_2015 <- gather(median_age_estimate_2015, key = "Sex", value = "median_age", `Male`,`Both.sexes`, `Female`)
view(gathered_medianage_estimate_2015)

#THIS IS THE 2016 DATASET FOR MEDIAN AGE
Census_2016_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2016_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2016_RaceEstimates_forVA$year <- 2016
#Change first column name
colnames(Census_2016_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2016_MedianAgeEstimates_forVA$LSAD <- word(Census_2016_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2016_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2016_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2016 <-Census_2016_MedianAgeEstimates_forVA[!(Census_2016_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2016) <- gsub(" ", ".", names(median_age_estimate_2016))
#Gathering data by including a sex column
gathered_medianage_estimate_2016 <- gather(median_age_estimate_2016, key = "Sex", value = "median_age", `Male`,`Both.Sexes`, `Female`)
view(gathered_medianage_estimate_2016)

#THIS IS THE 2017 DATASET FOR MEDIAN AGE
Census_2017_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2017_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2017_RaceEstimates_forVA$year <- 2017
#Change first column name
colnames(Census_2017_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2017_MedianAgeEstimates_forVA$LSAD <- word(Census_2017_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2017_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2017_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2017 <-Census_2017_MedianAgeEstimates_forVA[!(Census_2017_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2017) <- gsub(" ", ".", names(median_age_estimate_2017))
#Gathering data by including a sex column
gathered_medianage_estimate_2017 <- gather(median_age_estimate_2017, key = "Sex", value = "median_age", `Male`,`Both.Sexes`, `Female`)
view(gathered_medianage_estimate_2017)

#THIS IS THE 2018 DATASET FOR MEDIAN AGE
Census_2018_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2018_MedianAgeEstimates_forVA.csv")
#add a new column that denotes the year to dataframe
Census_2018_RaceEstimates_forVA$year <- 2018
#Change first column name
colnames(Census_2018_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2018_MedianAgeEstimates_forVA$LSAD <- word(Census_2018_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2018_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2018_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2018 <-Census_2018_MedianAgeEstimates_forVA[!(Census_2018_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2018) <- gsub(" ", ".", names(median_age_estimate_2018))
#Gathering data by including a sex column
gathered_medianage_estimate_2018 <- gather(median_age_estimate_2018, key = "Sex", value = "median_age", `Male`,`Both.Sexes`, `Female`)
view(gathered_medianage_estimate_2018)


#THIS IS THE 2019 DATASET FOR MEDIAN AGE
Census_2019_MedianAgeEstimates_forVA <- read_csv("Data/MedianAge/Census_2019_MedianAgeEstimates_forVA_0.csv")
#add a new column that denotes the year to dataframe
Census_2019_RaceEstimates_forVA$year <- 2019
#Change first column name
colnames(Census_2019_MedianAgeEstimates_forVA)[1] <- "county"
#Get the last word - either city or county - and put in its own column
Census_2019_MedianAgeEstimates_forVA$LSAD <- word(Census_2019_MedianAgeEstimates_forVA$county, -1)
#Remove the LSAD since it has its own column
Census_2019_MedianAgeEstimates_forVA$county <- gsub("\\s*\\w*$", "", Census_2019_MedianAgeEstimates_forVA$county)
#Remove the word Virginia from LSAD column
median_age_estimate_2019 <-Census_2019_MedianAgeEstimates_forVA[!(Census_2019_MedianAgeEstimates_forVA$LSAD =="Virginia"),]
#make all the spaces in the column name Both sexes a period instead to be readable when adding to leaflet map
names(median_age_estimate_2019) <- gsub(" ", ".", names(median_age_estimate_2019))
#Gathering data by including a sex column
gathered_medianage_estimate_2019 <- gather(median_age_estimate_2019, key = "Sex", value = "median_age", `Male`,`Both.Sexes`, `Female`)
view (gathered_medianage_estimate_2019)

#THIS IS MERGING ALL THE DATASETS TOGETHER
merged_medianage_data <- rbind(gathered_medianage_estimate_2011,
                               gathered_medianage_estimate_2012, 
                               gathered_medianage_estimate_2013, 
                               gathered_medianage_estimate_2014,
                               gathered_medianage_estimate_2015,
                               gathered_medianage_estimate_2016,
                               gathered_medianage_estimate_2017,
                               gathered_medianage_estimate_2018,
                               gathered_medianage_estimate_2019)
View(merged_medianage_data)
