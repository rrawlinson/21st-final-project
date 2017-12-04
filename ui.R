# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R ui interface for shiny app
# Generates html webpage with map plot and interactive labels

my.ui <- fluidPage(

titlePanel("Diversity in Seattle", windowTitle = "Diversity in Seattle"),

p("This was an interactive data visualization was made from the US Census Data on", 

    tags$a(href = "https://www.census.gov/newsroom/releases/archives/2010_census/cb11-cn170.html", "Race Distribution in the United States"),

    "Users can interact and ask questions about what the majority is in a certain zip code of seattle"), 

  #tags$li("actual mean, max, and min temperature"),

  #tags$li("record high and low temperature"),

  #tags$li("average high and low temperture"),

  p(),

  p("The code is available on ", tags$a(href = "https://github.com/rrawlinson/21st-final-project", "GitHub"), ".")

)



shinyUI(my.ui)
