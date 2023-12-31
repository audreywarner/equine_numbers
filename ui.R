# user interface code for equine_numbers_value_canada shiny app
# author: Tiffany A. Timbers
# created: Feb 27, 2017
# updated: Florencia D'Andrea / Mar 16, 2022

library(shiny)
library(leaflet)
library(tidyverse)

# get possible regions
horse_pop <- read_csv("data/00030067-eng.csv")
possible_regions <- unique(horse_pop$GEO)
possible_regions <- c(possible_regions[1], sort(possible_regions[-1]))


ui <- fluidPage(

  # Application title
  titlePanel("Historical horse population data from Canada \n (1906 - 1972)"),
  
  # Sidebar with a slider input for number of bins
     sidebarLayout(
     sidebarPanel(
       selectInput(inputId = "region",
                  label = "Geographic region:",
                  choices = possible_regions),

      plotOutput("horse_pop_Plot"),
      downloadButton("report", "Generate report")
    ),
    
    
    # put map in main panel entire background
    mainPanel(
      leafletOutput("horse_pop_map"),
      
      sliderInput(inputId = "year",
                  label = "Year:",
                  min = 1906,
                  max = 1972,
                  value = 1906,
                  sep = "", 
                  width='100%')
      )

  )
)

