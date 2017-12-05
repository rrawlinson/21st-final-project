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
    radioButtons("choices",
                  label = "choose:",
                  choiceNames = list("population", "percent"),
                  choiceValues = list("population" , "percent")
    ),
    selectInput("select", 
                  label = "Select race:",
                  choices = list("White", "Black or African American",
                                "American Indian and Alaska Native",
                                "Asian", "Native Hawaiian and Other Pacific Islander", 
                                "Other"
                  )
    ),
    selectInput("year", 
                label = "Year:",
                choices = list("2012", "2013", "2014", "2015")
                )
  
   ),
  
  mainPanel(
    plotOutput('plot'),
     tabsetPanel(tabPanel("Bar Graph", plotOutput("plot")))
            #tabPanel(title = "Map", value = "plot"), plotOutput("plot"))
               #tabPanel( title = "Graph", value = "graph") #plotlyOutput("tempplot"))
  )
)
)
 


shinyUI(my.ui)
