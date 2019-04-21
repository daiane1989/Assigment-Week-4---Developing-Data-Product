
#Libraries

library(shiny);library(datasets);library(dplyr)

# Define UI 
shinyUI(fluidPage(
  
  # title
  titlePanel("Linear Regression of Miles Gallon(mpg)"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("checkGroup", 
                         label = h3("Select the Predictor/s"), 
                         choices=names(select(mtcars,-mpg)),
                         selected = "cyl"), width=3
    ),
    
    mainPanel(
      h4(textOutput("caption")),
      verbatimTextOutput("fit"),
      plotOutput("mpgPlot")
    )
  )
))

