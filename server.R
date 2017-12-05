# Info 201b final project
# Project: Gentri-Track
# Group: 21st Ave

# R server for shiny app
# Creates data table of demographic information and locaiton






my.server <- function(input, output) {
  
  output$plot <- renderPlot({
    
    mydata12 <- get.data.for.year(input$year)
    
    #race <- input$select
    #num <- input$choices
    #column <- paste(race, num)
    
    plot <- ggplot(mydata12) +
      geom_bar(mapping = aes(x = region, y = input$select, fill = region), stat = "identity") +
      coord_flip() +
      labs(title = "Race Population and Zip Codes",  # plot title
           x = "Zip Codes",  # x-axis label (with units!)
           y = input$select)
    return(plot)

  })
}

shinyServer(my.server)


