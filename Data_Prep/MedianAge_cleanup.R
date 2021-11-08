library(tidyverse)
library(readr)
library(dplyr)

merged_median_age_data <- rbind("Census_2011_MedianAgeEstimates_forVA,
               Census_2012_MedianAgeEstimates_forVA,
               Census_2013_MedianAgeEstimates_forVA,
               Census_2014_MedianAgeEstimates_forVA,
               Census_2015_MedianAgeEstimates_forVA,
               Census_2016_MedianAgeEstimates_forVA,
               Census_2017_MedianAgeEstimates_forVA,
               Census_2018_MedianAgeEstimates_forVA,
               Census_2019_MedianAgeEstimates_forVA_0")
view(merged_median_age_data)
