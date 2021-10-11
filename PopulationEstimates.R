library(ggplot2)
library(xlsx)
library(readxl)
library(dplyr)

raw_pop_data <- read_xlsx("~/Housing-Trends/co-est2019-annres-51.xlsx", 
                          header = TRUE,
                          na.strings = "****")
summary(raw_pop_data)
View(raw_pop_data)

