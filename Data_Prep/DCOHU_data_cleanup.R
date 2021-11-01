library(readr)
library(tidyverse)
# library(data.table)


all_data <- list.files(path = "Data/Demographic Characteristics for Occupied Housing Units/",     # Identify all csv files in folder
                       pattern = "*.csv", full.names = TRUE) %>% 
  lapply(read_csv) %>%                                            # Store all files in list
  bind_rows                                                       # Combine data sets into one data set 

# all_data <- data.table::rbindlist(mapply(
#   c,
#   (
#     list.files(
#       path = "Data/Demographic Characteristics for Occupied Housing Units/",
#       pattern = "*csv",
#       full.names = TRUE
#     ) %>%
#       lapply(
#         read.table,
#         header = TRUE,
#         sep = ",",
#         encoding = "UTF-8"
#       )
#   ),
#   (
#     list.files(
#       path = "Data/Demographic Characteristics for Occupied Housing Units/",
#       pattern = "*csv",
#       full.names = TRUE
#     ) %>%
#       basename() %>%
#       as.list()
#   ),
#   SIMPLIFY = FALSE
# ),
# fill = T)

# Select the county name and occupied housing unit number columns
tidy_data <- all_data %>%
  select(2:3)

# Assign proper column names
colnames(tidy_data) <- c("county", "units")

# Remove every 31st row 
toDelete <- seq(1, nrow(tidy_data), 31)
clean_dcohu <- tidy_data[-toDelete,] %>% mutate(year = rep(2010:2019, each=30))

# Remove the ", Virginia" portion of the column
clean_dcohu$county <- gsub(",\\s*\\w*$", "", clean_dcohu$county)

# Get the last word - either city or County - and put in its own column
clean_dcohu$LSAD <- word(clean_dcohu$county, -1)

# Remove the LSAD since it has its own column
clean_dcohu$county <- gsub("\\s*\\w*$", "", clean_dcohu$county)

# Change the unit column's type from factor to numeric
clean_dcohu$units <- as.numeric(as.character(clean_dcohu$units))

# Create a state column to join only with counties in VA
# clean_dcohu$state <- factor(51)

# Convert county column's type from character to factor
clean_dcohu$county <- as.factor(clean_dcohu$county)
