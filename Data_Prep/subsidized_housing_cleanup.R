library(readr)

#Cleaning Data and Left Joining based on FIPS ID

subsidizedhousing_2015 <- read_csv("Data/Household/R12978459_SL050.csv", 
                                   col_types = cols(`Census Tracts` = col_skip(), 
                                                    Cities = col_skip(), `Core Based Statistical Areas` = col_skip(), 
                                                    County = col_skip(), `Name of Area` = col_skip(), 
                                                    Nation = col_skip(), Projects = col_skip(), 
                                                    `Public Housing Agencies` = col_skip(), 
                                                    `Qualifying Name` = col_skip(), State = col_skip(), 
                                                    `Tenant Congressional District` = col_skip()))
subsidizedhousing_2015 <- subsidizedhousing_2015[-c(1,136),]
colnames(subsidizedhousing_2015) [2] <-"2015"
colnames(subsidizedhousing_2015) [1] <-"Geo_FIPS"

subsidizedhousing_2016 <- read_csv("Data/Household/R12978517_SL050.csv", 
                                  col_types = cols(Geo_CBSA = col_skip(), 
                                                   Geo_CITIES = col_skip(), Geo_COUNTY = col_skip(), 
                                                   Geo_CT = col_skip(), Geo_NAME = col_skip(), 
                                                   Geo_NATION = col_skip(), Geo_PHA = col_skip(), 
                                                   Geo_PROJECTS = col_skip(), Geo_QNAME = col_skip(), 
                                                   Geo_STATE = col_skip(), Geo_TCD = col_skip()))
subsidizedhousing_2016 <- subsidizedhousing_2016[-c(135),]
colnames(subsidizedhousing_2016)[2] <-"2016"
subsidizedhousing_2017<- read_csv("Data/Household/R12978555_SL050.csv", 
                                  col_types = cols(Geo_CBSA = col_skip(), 
                                                   Geo_CITIES = col_skip(), Geo_COUNTY = col_skip(), 
                                                   Geo_CT = col_skip(), Geo_NAME = col_skip(), 
                                                   Geo_NATION = col_skip(), Geo_PHA = col_skip(), 
                                                   Geo_PROJECTS = col_skip(), Geo_QNAME = col_skip(), 
                                                   Geo_STATE = col_skip(), Geo_TCD = col_skip(), 
                                                   Geo_ZIPCODES = col_skip()))
subsidizedhousing_2017 <- subsidizedhousing_2017[-c(134),]
colnames(subsidizedhousing_2017)[2] <-"2017"

subsidizedhousing_2018 <- read_csv("Data/Household/R12978559_SL050.csv", 
                                   col_types = cols(Geo_CBSA = col_skip(), 
                                                    Geo_CITIES = col_skip(), Geo_COUNTY = col_skip(), 
                                                    Geo_CT = col_skip(), Geo_NAME = col_skip(), 
                                                    Geo_NATION = col_skip(), Geo_PHA = col_skip(), 
                                                    Geo_PROJECTS = col_skip(), Geo_QNAME = col_skip(), 
                                                    Geo_STATE = col_skip(), Geo_TCD = col_skip(), 
                                                    Geo_ZIPCODES = col_skip()))
colnames(subsidizedhousing_2018)[2] <- "2018"
subsidizedhousing_2018 <- subsidizedhousing_2018[-c(134),]
subsidizedhousing_2019 <- read_csv("Data/Household/R12978565_SL050.csv", 
                                   col_types = cols(Geo_CBSA = col_skip(), 
                                                    Geo_CITIES = col_skip(), Geo_COUNTY = col_skip(), 
                                                    Geo_CT = col_skip(), Geo_NATION = col_skip(), 
                                                    Geo_PHA = col_skip(), Geo_PROJECTS = col_skip(), 
                                                    Geo_QNAME = col_skip(), Geo_STATE = col_skip(), 
                                                    Geo_TCD = col_skip(), Geo_ZIPCODES = col_skip()))
colnames(subsidizedhousing_2019)[3] <-"2019"
subsidizedhousing_2019 <- subsidizedhousing_2019[-c(134),]

#left-joining all of the information into one table called Subsidized_housing by Geo_FIPS
subsidized_housing <-left_join(subsidizedhousing_2019, subsidizedhousing_2018, by='Geo_FIPS') %>%
  left_join(.,subsidizedhousing_2017, by= 'Geo_FIPS') %>%
  left_join(.,subsidizedhousing_2016, by= 'Geo_FIPS') %>%
  left_join(.,subsidizedhousing_2015, by= 'Geo_FIPS') 

#Gather by Year
yearly_subsidized_housing <- gather(subsidized_housing, key = "year", value = "total_subsidized_housing", `2015`:`2019`)

#Eliminate Geo_Fips
yearly_subsidized_housing$Geo_FIPS <- NULL

##Cleaning up columns
#splitting the city/county at the end of each word and adding it into a new column
yearly_subsidized_housing$LSAD <- word(yearly_subsidized_housing$`Geo_NAME`, -1)

#eliminate city/county from the "county" column
yearly_subsidized_housing$county <- gsub("\\s*\\w*$", "", yearly_subsidized_housing$`Geo_NAME`)
yearly_subsidized_housing$`Geo_NAME` <- NULL
yearly_subsidized_housing$total_subsidized_housing <- as.numeric(yearly_subsidized_housing$total_subsidized_housing)

