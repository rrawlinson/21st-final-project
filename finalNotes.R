


# This makes a map of counties in Washington
counties <- map_data("county")
wa_county <- subset(counties, region == "washington")

wa_base + 
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA)  

list <- c(98101,
          98102,
          98103,
          98104,
          98105,
          98106,
          98107,
          98108,
          98109,
          98111,
          98112,
          98113,
          98114,
          98115,
          98116,
          98117,
          98118,
          98119,
          98121,
          98122,
          98124,
          98125,
          98126,
          98127,
          98129,
          98131,
          98132,
          98133,
          98134,
          98136,
          98139,
          98141,
          98144,
          98145,
          98146,
          98154,
          98161,
          98164,
          98165,
          98170,
          98174,
          98175,
          98177,
          98178,
          98181,
          98185,
          98190,
          98191,
          98194,
          98195,
          98199)

install.packages('zipcode')
library(zipcode)
data(zipcode)
zipcode
library(dplyr)
mutate(zip = numeric(zip))


#install.packages("rgdal")
#install.packages("sp")
#install.packages("leaflet")
# MAPPING THE CENSUS DATA WITH GGPLOT
library(rgdal)    # for readOGR and others
library(sp)       # for spatial objects
library(leaflet)  # for interactive maps (NOT leafletR here)
library(dplyr)    # for working with data frames
library(ggplot2)  # for plotting

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-122.336, lat=47.609, popup="98101") %>% 
  addMarkers(lng=-122.321, lat=47.634, popup="98102") 
m  # Print the map

