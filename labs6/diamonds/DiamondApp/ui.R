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
library(dplyr)

shinyUI(fluidPage(
  
  titlePanel("Diamonds"),
  
   
  sidebarLayout(
    sidebarPanel(
       selectInput("select", "Quality", choices=c("depth", "table", "carat")),
       checkboxGroupInput("color", label = "Color",
                          list( "E", "I","J","H")),
       checkboxGroupInput("cut", label = "Cut",
                          list( "Ideal", "Premium", "Good", "Very Good", "Fair"))
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
