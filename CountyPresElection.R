library(tidyverse)
library(readr)
library(dplyr)

countypres_2000_2020 <- read_csv("Data/countypres_2000-2020.csv")

VAcountypres_2000_2020 <- countypres_2000_2020 %>% 
  filter(state_po=="VA", year== 2010:2020)
View(VAcountypres_2000_2020)
