#Income per capita income by race between 2010-2019 clean-up 
library(tidyverse)
library(dplyr)

# 2010 data here 
Income_Per_Capita_Race_2010 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2010.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2010$Year <- 2010
#Change column names
colnames(Income_Per_Capita_Race_2010)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2010)[2] <- "Mean Income"
Income_Per_Capita_Race_2010 %>% 
  rownames_to_column() %>% 
  gather(`Race/Ethnicity`, value, -Total Population) %>% 
  spread(rowname, value)

                                 

# 2011 data here 
Income_Per_Capita_Race_2011 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2011.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2011$Year <- 2011
#Change column names
colnames(Income_Per_Capita_Race_2011)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2011)[2] <- "Mean Income"

# 2012 data here 
Income_Per_Capita_Race_2012 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2012.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2012$Year <- 2012
#Change column names
colnames(Income_Per_Capita_Race_2012)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2012)[2] <- "Mean Income"

# 2013 data here 
Income_Per_Capita_Race_2013 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2013.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2013$Year <- 2013
#Change column names
colnames(Income_Per_Capita_Race_2013)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2013)[2] <- "Mean Income"

# 2014 data here 
Income_Per_Capita_Race_2014 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2014.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2014$Year <- 2014
#Change column names
colnames(Income_Per_Capita_Race_2014)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2014)[2] <- "Mean Income"

# 2015 data here 
Income_Per_Capita_Race_2015 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2015.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2015$Year <- 2015
#Change column names
colnames(Income_Per_Capita_Race_2015)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2015)[2] <- "Mean Income"

# 2016 data here 
Income_Per_Capita_Race_2016 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2016.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2016$Year <- 2016
#Change column names
colnames(Income_Per_Capita_Race_2016)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2016)[2] <- "Mean Income"

# 2017 data here 
Income_Per_Capita_Race_2017 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2017.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2017$Year <- 2017
#Change column names
colnames(Income_Per_Capita_Race_2017)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2017)[2] <- "Mean Income"

# 2018 data here 
Income_Per_Capita_Race_2018 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2018.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2018$Year <- 2018
#Change column names
colnames(Income_Per_Capita_Race_2018)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2018)[2] <- "Mean Income"

# 2019 data here 
Income_Per_Capita_Race_2019 <- read_csv("Data/Income Per Capita_Race/Incomepercapitarace2019.csv")
# add a new column that denotes the year to dataframe
Income_Per_Capita_Race_2019$Year <- 2019
#Change column names
colnames(Income_Per_Capita_Race_2019)[1] <- "Race/Ethnicity"
colnames(Income_Per_Capita_Race_2019)[2] <- "Mean Income"

