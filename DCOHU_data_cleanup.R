library(readr)
library(tidyverse)
library(data.table)

all_data <- rbindlist(mapply(
  c,
  (
    list.files(
      path = "Data/Demographic Characteristics for Occupied Housing Units/",
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
      path = "Data/Demographic Characteristics for Occupied Housing Units/",
      pattern = "*csv",
      full.names = TRUE
    ) %>%
      basename() %>%
      as.list()
  ),
  SIMPLIFY = FALSE
),
fill = T)

# Select the county name and occupied housing unit number columns
tidy_data <- all_data %>%
  select(2:3)

# Assign proper column names
colnames(tidy_data) <- c("county", "number of units")

# Remove every 31st row 
toDelete <- seq(1, nrow(tidy_data), 31)
clean_dcohu <- tidy_data[-toDelete,]


