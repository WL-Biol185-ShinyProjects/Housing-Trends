library(readxl)
library(ggplot2)
library(tidyverse)

tidy_pop_data <- read_excel("~/Housing-Trends/co-est2019-annres-51 (2).xlsx", 
                           skip = 3)
View(tidy_pop_data)

tidy_pop_data$Census <- NULL
tidy_pop_data$`Estimates Base`<-NULL
tidy_pop_data <- tidy_pop_data[-c(1,135:140),] 
colnames(tidy_pop_data)[1] <- "county"

yearly_pop_est <- gather(tidy_pop_data[1:11], key = "year", value = "index")


