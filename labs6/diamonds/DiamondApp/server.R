#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    df_diamonds <- diamonds %>%
      filter(color %in% input$color, cut %in% input$cut)
    ggplot(df_diamonds, aes_string(x = input$select, y = "price")) + geom_point()
})
  
})
