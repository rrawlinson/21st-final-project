# Test out getting and editing data frame

library("dplyr")
library("httr")
library("jsonlite")

source("key.R")

# seattle zip codes
# some of these don't have data for this table so we can
# remove those zip codes
zipcode.list <- c(98101, 98102, 98103, 98104, 98105, 98106,
          98107, 98108, 98109, 98111, 98112, 98113, 
          98114, 98115, 98116, 98117, 98118, 98119,
          98121, 98122, 98124, 98125, 98126, 98127,
          98129, 98131, 98132, 98133, 98134, 98136, 
          98139, 98141, 98144, 98145, 98146, 98154, 
          98161, 98164, 98165, 98170, 98174, 98175, 
          98177, 98178, 98181, 98185, 98190, 98191, 
          98195, 98199
)

ethnicity.list <- c(
  "DP05_0058E",  # Total population
  "DP05_0058PE", # Total percent
  "DP05_0059E",  # White population
  "DP05_0059PE", # white percent
  "DP05_0060E",  # Black or African American population
  "DP05_0060PE", # Black or African American percent
  "DP05_0061E",  # American Indian and Alaska Native population
  "DP05_0061PE", # American Indian and Alaska Native percent
  "DP05_0062E",  # Asian population
  "DP05_0062PE", # Asian percent
  "DP05_0063E",  # Native Hawaiian and Other Pacific Islander population
  "DP05_0063PE", # Native Hawaiian and Other Pacific Islander percent
  "DP05_0064E",  # Some other race population
  "DP05_0064PE"  # Some other race percent
)

zipcodes.param <- paste(zipcode.list, collapse = ",")
ethnicity.param <- paste(ethnicity.list, collapse = ",")


first.base.url <- "https://api.census.gov/data/"
year <- "2015"
second.base.url <- "/acs5/profile"
query <- paste0(first.base.url, year, second.base.url, "?")
key <- paste0("key=", census.key)
data <- paste0("get=", ethnicity.param)
area <- paste0("for=", "zip%20code%20tabulation%20area:", zipcodes.param)
full.url <- paste0(query, data, "&", area, "&", key)

# print(full.url)
df <- as.data.frame(fromJSON(full.url))
# print(is.data.frame(df))
names(df) <- as.matrix(df[1, ])
df <- df[-1, ]
# df[] <- lapply(df, function(x) type.convert(as.character(x))) # turns number values into characters
