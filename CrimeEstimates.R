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
View(crime2019)

crime2018 <- read_csv("Data/Crime/R12942816_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2018)

crime2017 <- read_csv("Data/Crime/R12942832_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2017)

crime2016 <- read_csv("Data/Crime/R12942840_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2016)

crime2015 <- read_csv("Data/Crime/R12942863_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), Nation = col_skip(), 
                                       `Qualifying Name` = col_skip(), State = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2015)

crime2014 <- read_csv("Data/Crime/R12942871_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2014)


crime2013 <- read_csv("Data/Crime/R12942877_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2013)

crime2012 <- read_csv("Data/Crime/R12942884_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2012)

crime2011 <- read_csv("Data/Crime/R12942889_SL050.csv", 
                      col_types = cols(County = col_skip(), 
                                       FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                       State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                       `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2011)

crime2010<- read_csv("Data/Crime/R12942896_SL050.csv", 
                     col_types = cols(County = col_skip(), 
                                      FIPS = col_skip(), `Qualifying Name` = col_skip(), 
                                      State = col_skip(), `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                      `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2010)


datatest<-  left_join(crime2010, crime2011, by='Name of Area') %>%
  left_join(., crime2012, by='Name of Area') 
View(datatest)









