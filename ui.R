# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R ui interface for shiny app
# Generates html webpage with map plot and interactive labels

source("apiData.R")
my.ui <- fluidPage(

titlePanel("Diversity in Seattle", windowTitle = "Diversity in Seattle"),

p("This was an interactive data visualization was made from the US Census Data on", 

    tags$a(href = "https://www.census.gov/newsroom/releases/archives/2010_census/cb11-cn170.html", "Race Distribution in the United States"),

    "Users can interact and ask questions about what the majority is in a certain zip code of seattle"), 

  #tags$li("actual mean, max, and min temperature"),

  #tags$li("record high and low temperature"),

  #tags$li("average high and low temperture"),

  p(),

  p("The code is available on ", tags$a(href = "https://github.com/rrawlinson/21st-final-project", "GitHub"), "."),
  
sidebarLayout(   
  sidebarPanel( 
    radioButtons("datatype",
                  label = "choose:",
                  choiceNames = list("population", "percent"),
                  choiceValues = list("population" , "percent")
    ),
    selectInput("race", 
                  label = "Select race:",
                  choices = list("White" = "White_", "Black or African American" = "Black_or_African_American_",
                                "American Indian and Alaska Native" = "American_Indian_and_Alaska_Native_",
                                "Asian" = "Asian_", "Native Hawaiian and Other Pacific Islander" = "Native_Hawaiian_and_Other_Pacific_Islander_", 
                                "Some other race" = "Some_other_race_")
                  )
    ),
    selectInput("year", 
                label = "Year:",
                choices = list("2012", "2013", "2014", "2015")
                )
  
   ),
  
  mainPanel(
    tabsetPanel(tabPanel("Bar Graph", plotOutput("plot"))
                #tabPanel("Map", )
                )
            
  )
)
)
 


shinyUI(my.ui)
