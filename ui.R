# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R ui interface for shiny app
# Generates html webpage with map plot and interactive labels
library("shinythemes")
source("apiData.R")
my.ui <- fluidPage(theme = shinytheme("slate"),

titlePanel("Diversity in Seattle", windowTitle = "Diversity in Seattle"),

  p("This is an interactive data visualization made from the US Census Data on", 
  tags$a(href = "https://www.census.gov/newsroom/releases/archives/2010_census/cb11-cn170.html", "Race Distribution in the United States"),
  "and the ",
  tags$a(href = "https://www.census.gov/newsroom/releases/archives/2010_census/cb11-cn170.html", "American Community Survey."),
  "Users can interact and ask questions about the diversity in Seattle by toggling between datatypes, races, and years. "),
  p(),
  p("The code is available on ", tags$a(href = "https://github.com/rrawlinson/21st-final-project", "GitHub"), "."),
  

  sidebarLayout( 
    mainPanel(
      plotOutput('map', width = "95%", height = "700px" )
    ), 
    
    sidebarPanel( 
       
      radioButtons("data.type",
                    label = "Choose:",
                    choiceNames = list("Population", "Percent"),
                    choiceValues = list("population" , "percent")
                   ),
      selectInput("race", 
                    label = "Select race:",
                    choices = list("Total" = "Total_", "White" = "White_", "Black or African American" = "Black_or_African_American_",
                                  "American Indian and Alaska Native" = "American_Indian_and_Alaska_Native_",
                                  "Asian" = "Asian_", "Native Hawaiian and Other Pacific Islander" = "Native_Hawaiian_and_Other_Pacific_Islander_", 
                                  "Some other race" = "Some_other_race_")
                  ),
      selectInput("year", 
                  label = "Year:",
                  choices = list("2012", "2013", "2014", "2015")
                  )
     )
  )

)
 


shinyUI(my.ui)
