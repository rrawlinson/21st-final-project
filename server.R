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
library(choroplethrZip)
library("stringr")

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
                           legend   = data.type))
  })
}

# my.server <- function(input, output) {
#   
#   output$plot <- renderPlot({
#     
#     data <- get.data.for.year(input$year)
#     
#     #race <- input$select
#     #num <- input$choices
#     #column <- paste(race, num)
#     
#     if (input$choices == "population") {
#       if (input$select == "White") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = White_population, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "White Population")
#       } else if (input$select == "Black or African American") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Black_or_African_American_population,fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Black or African American Population")
#       } else if (input$select == "American Indian and Alaska Native") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = American_Indian_and_Alaska_Native_population, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "American Indian and Alaska Native Population")
#       } else if (input$select == "Asian") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Asian_population, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Asian Population")
#       } else if (input$select == "Native Hawaiian and Other Pacific Islander") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Native_Hawaiian_and_Other_Pacific_Islander_population, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Native Hawaiian and Other Pacific Islander population")
#       } else if (input$select == "Some other race") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Some_other_race_population, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Some other race population")
#       } 
#     } else if (input$choices == "percent") {
#       if (input$select == "White") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = White_percent, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "White Percent")
#       } else if (input$select == "Black or African American") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Black_or_African_American_percent, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Black or African American Percent")
#       } else if (input$select == "American Indian and Alaska Native") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = American_Indian_and_Alaska_Native_percent, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "American Indian and Alaska Native Percent")
#       } else if (input$select == "Asian") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Asian_percent, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Asian Percent")
#       } else if (input$select == "Native Hawaiian and Other Pacific Islander") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Native_Hawaiian_and_Other_Pacific_Islander_percent, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Native Hawaiian and Other Pacific Islander percent")
#       } else if (input$select == "Some other race") {
#         plot <- ggplot(data) +
#           geom_col(mapping = aes(x = region, y = Some_other_race_percent, fill = region)) +
#           coord_flip() +
#           labs(title = "Race Population and Zip Codes",  # plot title
#                x = "Zip Codes",  # x-axis label (with units!)
#                y = "Some other race percent")
#       } 
#     }
#     
#     
#     return(plot)
# 
#   })
# }

shinyServer(my.server)



