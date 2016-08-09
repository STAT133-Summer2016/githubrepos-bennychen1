#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Life Expectancy and Income"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("year",
                   "Year",
                   min = 1800,
                   max = 2015,
                   value = 1800,
                   ticks = seq(1800,2015,by = 22),
                   step = 1,
                   animate = animationOptions(interval = 300,
                                              playButton = NULL,
                                              pauseButton = NULL))
                   
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot")
    )
)))
