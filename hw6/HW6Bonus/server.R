#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(ggvis)
library(readr)
library(dplyr)

shinyServer(function(input, output, session) {
  
  country_data = reactive({
    cleaned_demographics = read_csv("cleaned_demographics.csv") %>%
      filter(Year == input$year) %>%
      na.omit()
  })
  
    ggvis(country_data, ~GDPPC, ~LifeExpectancy, 
          size = ~Population, fill = ~Region, 
          stroke := "#000000",  strokeOpacity := ~Country,
          fillOpacity := 0.5) %>%
    layer_points() %>%
    add_tooltip(function(cleaned_demographics) paste("Country:", cleaned_demographics$Country, "<br>",
                                                     "Gdppc:", cleaned_demographics$GDPPC, "<br>", 
                                                     "Life Expectancy:", 
                                                     cleaned_demographics$LifeExpectancy)) %>%
    hide_legend("size") %>%
    scale_numeric("size", range = c(50, 2500)) %>%
    scale_nominal("fill", range = c("#66cc00", "#e6005c", "#ffff00", 
                                   "#840CC9", "#333333", "#4E41FA")) %>%
    scale_numeric("y", domain = seq(0, 100), expand = 0,
                   override = F, trans = "linear") %>%
    scale_numeric("x", domain = c(500, 50000), 
                  expand = 0, override = F, trans = "log") %>%
    add_axis("x", title = "GDP Per Capita (Inflation-Adjusted)", 
             values = c(500, 5000, 50000)) %>%
    add_axis("y", title = "Life Expectancy at Birth", 
              values = seq(0, 80, 10)) %>%
    set_options(height = 300, width = 1300) %>%
    bind_shiny("plot", "plot_ui")
})
