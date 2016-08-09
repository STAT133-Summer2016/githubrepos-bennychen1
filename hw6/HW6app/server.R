#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
  cleaned_demographics <- read.csv("cleaned_demographics.csv")
  output$plot <- renderPlot({
    df_demographics <- cleaned_demographics %>%
      filter(Year == input$year)
    
    ggplot(df_demographics, aes(x =GDPPC, y = LifeExpectancy, 
                                size = Population)) + 
    geom_point(aes(fill=Region), alpha = 0.7, shape = 21) + 
    scale_x_continuous(limits = c(500, 80000), breaks = c(500, 5000, 50000),
                        labels = c("$500", "$5000", "$50000"),
                        minor_breaks = c(1500, 15000),
                        expand = c(0.05, 0.1)) +
    scale_y_continuous(limits = c(25, 80), breaks = c(25, 50, 75),  
                         expand = c(0.1, 0),
                         minor_breaks = c(37.5, 62.5), 
                         labels = c("25 \n years", "50 \n years", "75 \n years")) +
    labs(title = input$year, x = "GDP Per Capita (Inflation-Adjusted)",
         y = "Life Expectancy at Birth") + 
    guides(size = FALSE) +
    scale_size_continuous(range = c(1,20)) +
    scale_fill_manual(values = c("#66cc00", "#e6005c", "#ffff00", 
                                  "#840CC9", "#333333", "#4E41FA")) + 
    coord_trans(x="log2") +
    theme(title = element_text(size = 20),
          axis.text.y = element_text(size = 12),
          axis.text.x = element_text(size =12),
          axis.title = element_text(size = 17))
  
})
})
