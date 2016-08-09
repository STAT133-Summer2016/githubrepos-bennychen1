#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Occupancy Rates in Berkeley"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Upload an XML file with the Census Data to get started"),
      
      fileInput("file", label = "File input"),
      
      selectInput("neigh", 
                  label = "Choose the neighborhood to inspect",
                  choices = list("North Berkeley", 
                                 "Rockridge",
                                 "Downtown Berkeley", 
                                 "Berkeley Hills"),
                  selected = "North Berkeley"),
      
      sliderInput("occupancy", 
                  label = "Number of People in Household:",
                  min = 0, max = 40, value = c(0, 40))
    ),
    
    mainPanel(
      textOutput("text1")
    )
  )
))
  