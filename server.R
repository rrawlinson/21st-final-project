# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R server for shiny app
# Creates data table of demographic information and locaiton
library("dplyr")
library("httr")

source("key.R")
first.base.url <- "api.census.gov/data/"
year <- "2016"
second.base.url <- "/acs/acs1/profile"
query <- first.base.url + year + second.base.url + "?"
key <- "key=" + census.key
data <- "get=" + "NAME"
area <- "for=" + "state:01"
full.url <- query + data + "&" + area + "&" + area

print(full.url)

df <- GET()



my.server <- function(input, output) {}

shinyServer(my.server)