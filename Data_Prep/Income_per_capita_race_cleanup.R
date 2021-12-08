#Income per capita income by race between 2010-2019 clean-up 
library(tidyverse)
library(dplyr)

Income_Per_Capita_Race_2010 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2010.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita$Year <- 2010
#Change column names
colnames(Income_Per_Capita_Race_2010)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2010)[2] <- "Mean Income"
view(Income_Per_Capita_Race_2010)

#Gathering data
gathered_race_estimates <- gather(Income_Per_Capita_Race_2010, 
                                  key = "Race/Ethnicity", value = "Mean Income",
                                  `White.`,`African.American.Alone`,
                                  `Asian.Alone`,`Other.Races.Alone`,
                                  `Two.or.more.races`)