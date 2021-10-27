library(readr)
library(tidyverse)
library(data.table)

all_data <- rbindlist(mapply(
  c,
  (
    list.files(
      path = "Data/Census Race Estimates for VA/",
      pattern = "*csv",
      full.names = TRUE
    ) %>%
      lapply(
        read.table,
        header = TRUE,
        sep = ",",
        encoding = "UTF-8"
      )
  ),
  (
    list.files(
      path = "Data/Census Race Estimates for VA/",
      pattern = "*csv",
      full.names = TRUE
    ) %>%
      basename() %>%
      as.list()
  ),
  SIMPLIFY = FALSE
),
fill = T)

# Select the county name and race columns 
tidy_data <- all_data %>%
  select(1:7)