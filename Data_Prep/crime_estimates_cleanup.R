library(tidyverse)
library(plyr)
library(readr)

#importing data 2010-2019
crime2019 <- read_csv("Data/Crime/R12939511_SL050.csv", 
                            col_types = cols(County = col_skip(), 
                                             FIPS = col_skip(), Nation = col_skip(), 
                                             `Qualifying Name` = col_skip(), State = col_skip(), 
                                             `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                             `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
  crime2019 <- crime2019[-c(1),] 
  colnames(crime2019)[2] <- "2019"

crime2018 <- read_csv("Data/Crime/R12942816_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
  crime2018 <- crime2018[-c(1),] 
  colnames(crime2018)[2] <- "2018"

crime2017 <- read_csv("Data/Crime/R12942832_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2017 <- crime2017[-c(1),] 
  colnames(crime2017)[2] <- "2017"


crime2016 <- read_csv("Data/Crime/R12942840_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2016 <- crime2016[-c(1),] 
colnames(crime2016)[2] <- "2016"


crime2015 <- read_csv("Data/Crime/R12942863_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2015 <- crime2015[-c(1),] 
colnames(crime2015)[2] <- "2015"


crime2014 <- read_csv("Data/Crime/R12942871_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2014 <- crime2014[-c(1),] 
colnames(crime2014)[2] <- "2014"



crime2013 <- read_csv("Data/Crime/R12942877_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2013 <- crime2013[-c(1),] 
colnames(crime2013)[2] <- "2013"


crime2012 <- read_csv("Data/Crime/R12942884_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2012 <- crime2012[-c(1),] 
colnames(crime2012)[2] <- "2012"


crime2011 <- read_csv("Data/Crime/R12942889_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2011 <- crime2011[-c(1),] 
colnames(crime2011)[2] <- "2011"


crime2010<- read_csv("Data/Crime/R12942896_SL050.csv", 
                     col_types = cols(County = col_skip(), 
                                      FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                      State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                      `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2010 <- crime2010[-c(1),] 
colnames(crime2010)[2] <- "2010"


#left-joining all of the information into one table called crime_est
crime_est<-left_join(crime2019, crime2018, by='Name of Area') %>%
  left_join(.,crime2017, by= 'Name of Area') %>%
  left_join(.,crime2016, by= 'Name of Area') %>%
  left_join(.,crime2015, by= 'Name of Area') %>%
  left_join(.,crime2014, by= 'Name of Area') %>%
  left_join(.,crime2013, by= 'Name of Area') %>%
  left_join(.,crime2012, by= 'Name of Area') %>%
  left_join(.,crime2011, by= 'Name of Area') %>%
  left_join(.,crime2010, by= 'Name of Area') 

#gathering to show the yearly crime estimates
yearly_crime_est <- gather(crime_est, key = "year", value = "total_violent_pop_crime_estimate", `2010`:`2019`)

##Cleaning up columns
#splitting the city/county at the end of each word and adding it into a new column
yearly_crime_est$LSAD <- word(yearly_crime_est$`Name of Area`, -1)

#eliminate city/county from the "county" column
yearly_crime_est$county <- gsub("\\s*\\w*$", "", yearly_crime_est$`Name of Area`)
yearly_crime_est$`Name of Area` <- NULL
yearly_crime_est$total_violent_pop_crime_estimate <- as.numeric(yearly_crime_est$total_violent_pop_crime_estimate)











