#Import 2013-2020 Data & Clean Data to only display State Name, LEANM, Total,year
library(readr)
homeless_enrolled_2013_14 <- read_csv("Data/Homelessness/lea-homeless-enrolled-sy2013-14-pub.csv", 
                                                col_types = cols(CWD = col_skip(), DOUBLED_UP = col_skip(), 
                                                                 FIPST = col_skip(), HOTELS_MOTELS = col_skip(), 
                                                                 LEAID = col_skip(),
                                                                 LEP = col_skip(), 
                                                                 MIG = col_skip(), PREK_FLAG = col_skip(), 
                                                                 SHELTERED = col_skip(), SUBGRANT_STATUS = col_skip(), 
                                                                 UHY = col_skip(), UNSHELTERED = col_skip())) %>% filter(STNAM == "VIRGINIA")
homeless_enrolled_2013_14$year <- "2013-14" 
homeless_enrolled_2014_15 <- read_csv("Data/Homelessness/lea-homeless-enrolled-sy2014-15.csv", 
                                      col_types = cols(CDW = col_skip(), DATE_CUR = col_skip(), 
                                                       DOUBLED_UP = col_skip(), FIPST = col_skip(), 
                                                       HOTELS_MOTELS = col_skip(),
                                                       LEAID = col_skip(),
                                                       LEP = col_skip(), MIG = col_skip(), 
                                                       PREK_FLAG = col_skip(), SHELTERED = col_skip(), 
                                                       SUBGRANT_STATUS = col_skip(), UHY = col_skip(), 
                                                       UNSHELTERED = col_skip())) %>% filter(STNAM == "VIRGINIA")

homeless_enrolled_2014_15$year <- "2014-15"
homeless_enrolled_2015_16 <- read_csv("Data/Homelessness/lea-homeless-enrolled-sy2015-16.csv", 
                                      col_types = cols(CDW = col_skip(), DATE_CUR = col_skip(), 
                                                       DOUBLED_UP = col_skip(), FIPST = col_skip(), 
                                                       HOTELS_MOTELS = col_skip(),
                                                       LEP = col_skip(), MIG = col_skip(), LEAID = col_skip(),
                                                       PREK_FLAG = col_skip(), SCHOOL_YEAR_TEXT = col_skip(), 
                                                       SHELTERED = col_skip(), SUBGRANT_STATUS = col_skip(), 
                                                       UHY = col_skip(), UNSHELTERED = col_skip())) %>% filter(STNAM == "VIRGINIA")
homeless_enrolled_2015_16$year <- "2015-16"
homeless_enrolled_2016_17 <- read_csv("Data/Homelessness/lea-homeless-enrolled-sy2016-17.csv", 
                                        col_types = cols(CDW = col_skip(), DATE_CUR = col_skip(), 
                                                         DOUBLED_UP = col_skip(), FIPST = col_skip(),
                                                         LEAID = col_skip(),
                                                         HOTELS_MOTELS = col_skip(), LEP = col_skip(), 
                                                         MIG = col_skip(), PREK_FLAG = col_skip(), 
                                                         SCHOOL_YEAR_TEXT = col_skip(), SHELTERED = col_skip(), 
                                                         ST_LEAID = col_skip(), SUBGRANT_STATUS = col_skip(), 
                                                         UHY = col_skip(), UNSHELTERED = col_skip())) %>% filter(STNAM == "VIRGINIA")
homeless_enrolled_2016_17$year <- "2016-17"
homeless_enrolled_2017_18 <- read_csv("Data/Homelessness/lea-homeless-enrolled-sy2017-18.csv", 
                                      col_types = cols(CWD = col_skip(), DATE_CUR = col_skip(), 
                                                       DOUBLED_UP = col_skip(), EL = col_skip(), 
                                                       FIPST = col_skip(), HOTELS_MOTELS = col_skip(), 
                                                       MIG = col_skip(), 
                                                       LEAID = col_skip(),
                                                       PREK_FLAG = col_skip(), SCHOOL_YEAR_TEXT = col_skip(), 
                                                       SHELTERED = col_skip(), ST_LEAID = col_skip(), 
                                                       SUBGRANT_STATUS = col_skip(), UHY = col_skip(), 
                                                       UNSHELTERED = col_skip())) %>% filter(STNAM == "VIRGINIA")
homeless_enrolled_2017_18$year <- "2017-18"
homeless_enrolled_2018_19 <- read_csv("Data/Homelessness/lea-homeless-enrolled-sy2018-19-wide.csv", 
                                       col_types = cols(CWD = col_skip(), DATE_CUR = col_skip(), 
                                                        DOUBLED_UP = col_skip(), EL = col_skip(), 
                                                        FIPST = col_skip(), HOTELS_MOTELS = col_skip(), 
                                                        LEAID = col_skip(),
                                                        MIG = col_skip(), PREK_FLAG = col_skip(), 
                                                        SCHOOL_YEAR_TEXT = col_skip(), SHELTERED_TRANSITIONAL_HOUSING = col_skip(), 
                                                        ST_LEAID = col_skip(), SUBGRANT_STATUS = col_skip(), 
                                                        UHY = col_skip(), UNSHELTERED = col_skip())) %>% filter(STNAM == "VIRGINIA")
homeless_enrolled_2018_19$year <-"2018-19"
#Left Join all files
homeless_enrolled<-
  left_join(homeless_enrolled_2018_19, homeless_enrolled_2017_18, by='LEANM') %>%
  left_join(.,homeless_enrolled_2016_17, by= 'LEANM') %>%
  left_join(.,homeless_enrolled_2015_16, by= 'LEANM') %>%
  left_join(.,homeless_enrolled_2014_15, by= 'LEANM') %>%
  left_join(.,homeless_enrolled_2013_14, by= 'LEANM') 

