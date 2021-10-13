library(readxl)
library(ggplot2)
library(tidyverse)

tidy_pop_data <- read_excel("~/Housing-Trends/co-est2019-annres-51 (2).xlsx", 
                           skip = 3)
View(tidy_pop_data)

yearly_pop_est <- gather(tidy_pop_data[4:13], key = "year", value = "index")
View(yearly_pop_est)

