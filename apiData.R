# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# Gets demographic data from census API

library("dplyr")
# library("httr")
library("jsonlite")

source("key.R")
source("lists.R")


zipcodes.param <- paste(zipcode.list, collapse = ",")
ethnicity.param <- paste(ethnicity.list, collapse = ",")

first.base.url <- "https://api.census.gov/data/"
second.base.url <- "/acs5/profile"
key <- paste0("key=", census.key)
data <- paste0("get=", ethnicity.param)
area <- paste0("for=", "zip%20code%20tabulation%20area:", zipcodes.param)


get.data.for.year <- function(year) { # year between 2012 and 2015
  query <- paste0(first.base.url, year, second.base.url, "?")
  full.url <- paste0(query, data, "&", area, "&", key)
  
  # print(full.url)
  df <- as.data.frame(fromJSON(full.url))
  #is.data.frame(df)
  names(df) <- as.matrix(df[1,])
  df <- df[-1,]
  # df[] <- lapply(df, function(x) type.convert(as.character(x))) # turns number values into characters
  names(df) <- new.names
  
  return(df)
}