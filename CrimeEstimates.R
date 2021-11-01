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
View(crime2019)

crime2018 <- read_csv("Data/Crime/R12942816_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
  crime2018 <- crime2018[-c(1),] 
  colnames(crime2018)[2] <- "2018"
View(crime2018)

crime2017 <- read_csv("Data/Crime/R12942832_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2017 <- crime2017[-c(1),] 
  colnames(crime2017)[2] <- "2017"
View(crime2017)

crime2016 <- read_csv("Data/Crime/R12942840_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2016 <- crime2016[-c(1),] 
colnames(crime2016)[2] <- "2016"
View(crime2016)

crime2015 <- read_csv("Data/Crime/R12942863_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2015 <- crime2015[-c(1),] 
colnames(crime2015)[2] <- "2015"
View(crime2015)

crime2014 <- read_csv("Data/Crime/R12942871_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2014 <- crime2014[-c(1),] 
colnames(crime2014)[2] <- "2014"
View(crime2014)


crime2013 <- read_csv("Data/Crime/R12942877_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2013 <- crime2013[-c(1),] 
colnames(crime2013)[2] <- "2013"
View(crime2013)

crime2012 <- read_csv("Data/Crime/R12942884_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2012 <- crime2012[-c(1),] 
colnames(crime2012)[2] <- "2012"
View(crime2012)

crime2011 <- read_csv("Data/Crime/R12942889_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2011 <- crime2011[-c(1),] 
colnames(crime2011)[2] <- "2011"
View(crime2011)

crime2010<- read_csv("Data/Crime/R12942896_SL050.csv", 
                     col_types = cols(County = col_skip(), 
                                      FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                      State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                      `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
crime2010 <- crime2010[-c(1),] 
colnames(crime2010)[2] <- "2010"
View(crime2010)


crime_est<-left_join(crime2019, crime2018, by='Name of Area') %>%
  left_join(.,crime2017, by= 'Name of Area') %>%
  left_join(.,crime2016, by= 'Name of Area') %>%
  left_join(.,crime2015, by= 'Name of Area') %>%
  left_join(.,crime2014, by= 'Name of Area') %>%
  left_join(.,crime2013, by= 'Name of Area') %>%
  left_join(.,crime2012, by= 'Name of Area') %>%
  left_join(.,crime2011, by= 'Name of Area') %>%
  left_join(.,crime2010, by= 'Name of Area') 
View(crime_est)

yearly_crime_est <- gather(crime_est, key = "year", value = "total_violent_pop_crime_estimate", `2010`:`2019`)
yearly_crime_est$LSAD <- word(yearly_crime_est$`Name of Area`, -1)
yearly_crime_est$county <- gsub("\\s*\\w*$", "", yearly_crime_est$`Name of Area`)
yearly_crime_est <- col_skip(`Name of Area`)
yearly_crime_est$`Name of Area` <- NULL
View(yearly_crime_est)











