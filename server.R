shinyServer(  
  function(input, output) {   
    set.seed(12345)
    data <- reactive(rnorm(input$n, mean = input$mean, sd = input$sd))
    
    output$rnormPlot <- renderPlot({
      hist(data())
    })
    
    output$rnormMean <- renderPrint({paste("Mean:    ", mean(data()))})
    output$rnormSd <- renderPrint({paste("Std dev: ", sd(data()))})
  }
)