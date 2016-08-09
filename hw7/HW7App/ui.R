
library(shiny)
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(maps)
library(stringr)

shinyUI(fluidPage(

  titlePanel("Linguistic Data"),
  
  sidebarLayout(
    sidebarPanel(
       uiOutput("questionchoice")
    ),
    
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
