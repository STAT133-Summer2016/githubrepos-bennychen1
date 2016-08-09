
library(shiny)
library(shiny)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(maps)
library(stringr)
library(scales)

shinyServer(function(input, output, session) {
  
  output$questionchoice <- renderUI ({
    qa <- read_csv("qa.csv")
    selectInput("question", 
                label = "Choose a Question",
                choices = unique(qa$quest))
  })
   
  output$distPlot <- renderPlot({
    states <- map_data("state")
    qa <- read_csv("qa.csv") %>%
      filter(quest == input$question) %>%
      inner_join(states, by = c("STATE" = "region"))
    ggplot(qa) +
      geom_polygon(aes(x = long, y = lat, fill = ans, group = group), color = "black") +
      ggtitle(input$question) + 
      labs(fill = "Answer") +
      theme_minimal() +
      theme(axis.line=element_blank(),axis.text.x=element_blank(),
            axis.text.y=element_blank(),axis.ticks=element_blank(),
            axis.title.x=element_blank(),
            axis.title.y=element_blank(),
            panel.background=element_blank(),panel.border=element_blank(),
            panel.grid.major=element_blank(),
            panel.grid.minor=element_blank(),plot.background=element_blank())
      
  })
  
})
