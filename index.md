---
title       : Data Products Course Project
subtitle    : Coursera Data Science Specialization
author      : Greg Michalopoulos
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## My shiny application

My shiny application can help you understand the effect of

* Number of samples (n)
* Mean (mean)
* Standard deviation (sd)

on a histogram of a random sample of normals.

--- .class #id 

## UI.R




```r
shinyUI(pageWithSidebar(  
  headerPanel("Standard Normal Distribution"),  
  sidebarPanel(    
    sliderInput("n", label = "# of random standard normal variables",
                min = 1, max = 1000, value = c(100)),
    numericInput("mean", "Distribution mean", 0, min = -100, max = 100, step = 1),
    numericInput("sd", "Distribution standard deviation", 1, min = 0, max = 100, step = 1),
    h4("Adjust the parameters to change the histogram of random normals."),
    h4("Slider: Adjusts the number (n) of random normals."),
    h4("Mean (mean) and standard deviation (sd) adjust the respective 
       parameter to the rnorm R function.")
  ),
  mainPanel(    
    plotOutput("rnormPlot"),
    textOutput("rnormMean"),
    textOutput("rnormSd")
  )
))
```

---

## Server.R

* Reactive expression is used to create the sample of normals.
* Reactive output is used to render the histogram plot.


```r
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
```

---

## An example plot

Looks like this:


```r
hist(rnorm(100, 0, 1))
```

<img src="figure/unnamed-chunk-4-1.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" width="500px" />
