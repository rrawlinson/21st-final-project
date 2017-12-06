# test out plotting map

# devtools::install_github("tidyverse/ggplot2")
# library(ggplot2)
# library(zipcode)
# library(tidyverse)
# library(maps)
# library(viridis)
# library(ggthemes)
# devtools::install_github("hrbrmstr/albersusa")
# library(albersusa)#installed via github
#data
source("apiData.R")

fm <- get.data.for.year("2015")  # Export <- read_csv("~/Downloads/Export (1).csv")#the file we just downloaded
# data(zipcode)
# fm$zip <- clean.zipcodes(fm$zip)
# # size by zip
# # fm.zip<-aggregate(data.frame(count=fm$FMID),list(zip=fm$zip,county=fm$County),length)
# fm <- merge(fm, zipcode, by='zip')

# library(ggplot2)
# library(choroplethr)
library(choroplethrZip)
# 
# 
# ?zip.regions
data(zip.regions)
# 
# 
?df_pop_zip
data(df_pop_zip)
# 
# #?zip_choropleth
# zip_choropleth(df_pop_zip,
#                state_zoom = "new york",
#                title      = "2012 New York State ZCTA Population Estimates",
#                legend     = "Population") + coord_map()

# install.packages("devtools")
# library(devtools)
# install_github('arilamstein/choroplethrZip@v1.3.0')
# library(choroplethrZip)
# 
# data(df_pop_zip)
# 
# # ec = east coast
# 
zipcode.list <- c("98101", "98102", "98103", "98104", "98105", "98106", "98107", "98108", "98109", 
                  "98112", "98115", "98116", "98117", "98118", "98119",
                  "98121", "98122", "98125", "98126",
                  "98133", "98134", "98136",
                  "98144", "98146",
                  "98154",
                  "98164", 
                  "98174", "98177", "98178", 
                  
                  "98195", "98199"
)
# 98111, 98113, 98114, 
# 98124, 98127, 98129
# "98131", "98132", "98139", 
# "98141",  "98145", 
# "98161","98165",
# "98170", "98175", 
# "98181", "98185",
# "98190", "98191", 

# manhattan_les = c("10002", "10003", "10009", "10021", "10028", "10044", "10128")
# manhattan_ues = c()

data(df_zip_demographics)
?df_zip_demographics
colnames(df_zip_demographics)


print(zip_choropleth(df_pop_zip,
               msa_zoom = "Seattle-Tacoma-Bellevue, WA",
               title    = "2012 NY-Newark-Jersey City MSA\nZCTA Population Estimates",
               legend   = "Population"))



