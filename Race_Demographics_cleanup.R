library(dplyr)
library(readr)
library(data.table)
library(tidyverse)

all_data <- list.files(path = "Data/Census Race Estimates for VA",
                       pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read_csv) %>%                                      
  bind_rows      
