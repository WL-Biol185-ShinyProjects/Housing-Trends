library(dplyr)
library(readr)
library(data.table)
library(tidyverse)

df <- list.files(path="Data/Census Race Estimates for VA", full.names = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows

