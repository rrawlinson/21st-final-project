


# This makes a map of counties in Washington
counties <- map_data("county")
wa_county <- subset(counties, region == "washington")

wa_base +
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA)

