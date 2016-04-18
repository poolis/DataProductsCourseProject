library(shiny)
shinyUI(pageWithSidebar(  
  headerPanel("My shiny project!"),  
  sidebarPanel(    
    sliderInput("n", label = "# of random standard normal variables",
                min = 1, max = 10000, value = c(100)),
    numericInput("mean", "Distribution mean", 0, min = -100, max = 100, step = 1),
    numericInput("sd", "Distribution standard deviation", 1, min = 0, max = 100, step = 1)
  ),
  mainPanel(    
    plotOutput("rnormPlot")
  )
))