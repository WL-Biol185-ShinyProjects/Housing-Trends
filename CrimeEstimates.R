library(tidyverse)
library(readr)

crime2019 <- read_csv("Data/Crime/R12939511_SL050.csv", 
                            col_types = cols(County = col_skip(), 
                                             FIPS = col_skip(), Nation = col_skip(), 
                                             `Qualifying Name` = col_skip(), State = col_skip(), 
                                             `Total Violent and Property Crimes Rate: Property Crimes Rate` = col_skip(), 
                                             `Total Violent and Property Crimes Rate: Violent Crimes Rate` = col_skip()))
View(crime2019)



