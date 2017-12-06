# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R server for shiny app
# Creates data table of demographic information and locaiton


my.server <- function(input, output) {
  
  output$plot <- renderPlot({
    
    data <- get.data.for.year(input$year)
    
    #race <- input$select
    #num <- input$choices
    #column <- paste(race, num)
    
    if (input$choices == "population") {
      if (input$select == "White") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = White_population, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "White Population")
      } else if (input$select == "Black or African American") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Black_or_African_American_population,fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Black or African American Population")
      } else if (input$select == "American Indian and Alaska Native") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = American_Indian_and_Alaska_Native_population, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "American Indian and Alaska Native Population")
      } else if (input$select == "Asian") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Asian_population, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Asian Population")
      } else if (input$select == "Native Hawaiian and Other Pacific Islander") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Native_Hawaiian_and_Other_Pacific_Islander_population, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Native Hawaiian and Other Pacific Islander population")
      } else if (input$select == "Some other race") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Some_other_race_population, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Some other race population")
      } 
    } else if (input$choices == "percent") {
      if (input$select == "White") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = White_percent, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "White Percent")
      } else if (input$select == "Black or African American") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Black_or_African_American_percent, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Black or African American Percent")
      } else if (input$select == "American Indian and Alaska Native") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = American_Indian_and_Alaska_Native_percent, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "American Indian and Alaska Native Percent")
      } else if (input$select == "Asian") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Asian_percent, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Asian Percent")
      } else if (input$select == "Native Hawaiian and Other Pacific Islander") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Native_Hawaiian_and_Other_Pacific_Islander_percent, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Native Hawaiian and Other Pacific Islander percent")
      } else if (input$select == "Some other race") {
        plot <- ggplot(data) +
          geom_col(mapping = aes(x = region, y = Some_other_race_percent, fill = region)) +
          coord_flip() +
          labs(title = "Race Population and Zip Codes",  # plot title
               x = "Zip Codes",  # x-axis label (with units!)
               y = "Some other race percent")
      } 
    }
    
    
    return(plot)

  })
}

shinyServer(my.server)



