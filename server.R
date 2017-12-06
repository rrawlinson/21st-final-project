# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R server for shiny app
# Creates data table of demographic information and locaiton

# how to install choroplethrZip
# install.packages("devtools")
# library(devtools)
# install_github('arilamstein/choroplethrZip@v1.3.0')
# library(choroplethrZip)

source("apiData.R")
library("choroplethrZip")
library("stringr")
library("ggmap")


my.server <- function(input, output) {
  
   map.df <- reactive({
     return(get.data.for.year(input$year)) # example: "2015"
   })
  
   output$map <- renderPlot({
     ####################################################
     # get info for map
     df <- map.df()
  
     race <- input$race # example: "White_"
     data.type <- input$data.type # example: "population"
  
     map.data <- df %>%  select(zip.code, eval(paste0(race, data.type)))
     names(map.data) <- c("region", "value")
     # map.data <- map.data %>% transform(value = as.numeric(value))
     map.data$region <- as.character(as.factor(map.data$region)) # change zip codes to characters
     map.data$value <- as.numeric(as.character(map.data$value)) # change values to numeric
     map.data <- map.data %>% arrange(value) # arrange by value
  
     title.name <- str_replace_all(race, "_", " ")
     ####################################################
                        return(zip_choropleth(map.data,
                            zip_zoom = zipcode.list,
                            title    = paste0("Seattle ", title.name, "Ethnic Information by Zip Code"),
                            legend   = data.type
                              ))
   })
}

shinyServer(my.server)



