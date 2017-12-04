# Test out getting and editing data frame

library("dplyr")
library("httr")
library("curl")
library("jsonlite")

source("key.R")
first.base.url <- "https://api.census.gov/data/"
year <- "2016"
second.base.url <- "/acs/acs1/profile"
query <- paste0(first.base.url, year, second.base.url, "?")
key <- paste0("key=", census.key)
data <- paste0("get=", "NAME")
area <- paste0("for=", "state:*")
full.url <- paste0(query, data, "&", area, "&", area, "&", key)

print(full.url)

df <- (GET(full.url))
df1 <- fromJSON(content(df, "text"), header = TRUE)