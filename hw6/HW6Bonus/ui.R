#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(ggvis)
fluidPage(
  headerPanel("Life Expectancy and Income"),
  
  mainPanel(
    ggvisOutput("plot"),
    sliderInput("year", "Year:", 
                min = 1800, 
                max = 2015, 
                value = 1800,  
                tick = F,
                step = 1,
                animate = animationOptions(interval = 300, 
                                           loop = FALSE, 
                                           playButton = NULL, 
                                           pauseButton = NULL)),
    uiOutput("plot_ui")
  )
)
