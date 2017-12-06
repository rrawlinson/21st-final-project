# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# Lists of things for shiny server

zipcode.list <- c(98101, 98102, 98103, 98104, 98105, 98106, 98107, 98108, 98109, 
                  98112, 98115, 98116, 98117, 98118, 98119,
                  98121, 98122, 98125, 98126, 
                  98133, 98134, 98136,
                  98144, 98146, 98148, 
                  98155,
                  98164, 98166, 98168, 
                  98177, 98178, 
                  98188, 
                  98195, 98198, 98199
)
# Not Seattle :(
# 98154, 98158, 98174
# No Data :(
# 98111, 98113, 98114, 98124, 98127, 98129, 98131,  98138, 98139, 98141, 98145, 
# 98160, 98161, 98165, 98170, 98175, 98181, 98185, 98190, 98191, 98194, 


ethnicity.list <- c(
  "DP05_0058E",  # Total population
  "DP05_0058PE", # Total percent
  "DP05_0059E",  # White population
  "DP05_0059PE", # White percent
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

# names for data frame
new.names <- c(
  "Total_population",
  "Total_percent",
  "White_population",
  "White_percent",
  "Black_or_African_American_population",
  "Black_or_African_American_percent",
  "American_Indian_and_Alaska_Native_population",
  "American_Indian_and_Alaska_Native_percent",
  "Asian_population",
  "Asian_percent",
  "Native_Hawaiian_and_Other_Pacific_Islander_population",
  "Native_Hawaiian_and_Other_Pacific_Islander_percent",
  "Some_other_race_population",
  "Some_other_race_percent",
  "zip.code"
)