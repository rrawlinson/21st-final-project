# Diversity in Seattle
## By Daniel Sullivan, Autumn Derr, Ruby Rawlinson, and A.J. Schramm

Using ggplot and choroplethr packages, we created a map of Seattle zip codes.  With this map, we pulled specific race information from the US Census according to each zip code. The color of the zip code region corresponds to the amount of people of the selected race living in that area. The darker the color, the greater the concentration.

Questions Answered:
- Which places are the most diverse in the Seattle area?
- What race is the majority in certain areas?
- Show the shift/migration patterns over time

Hosted on shinyapps.io here: [Diversity in Seattle](https://dtsullivan.shinyapps.io/diversity-in-seattle/)

Technical Aspects:
- R Language
- R Packages:
  - dplyr
  - ggplot2
  - choroplethr
  - shiny
  - ggmap
  - shinythemes
  - jsonlite
- Files:
  - server.R
  - ui.R
  - apiData.R
  - README.md
