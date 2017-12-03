


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