# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R server for shiny app
# Creates data table of demographic information and locaiton






my.server <- function(input, output) {
  
  output$plot <- renderPlot({
    
    mydata12 <- get.data.for.year(input$year)
    
    plot <- ggplot(mydata12) +
            geom_bar(mapping = aes(x = region, y = White_population, fill = region), stat = "identity") 
    return(plot)

  })
}

shinyServer(my.server)


