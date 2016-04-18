shinyServer(  
  function(input, output) {    
    output$rnormPlot <- renderPlot({      
      data <- rnorm(input$n, mean = input$mean, sd = input$sd)
      hist(data)
    })
  }
)