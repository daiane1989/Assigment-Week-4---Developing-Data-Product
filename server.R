#Load Libraries

library(shiny);library(datasets)

data = mtcars
data$am = factor(data$am, labels = c("Automatic", "Manual"))
data$cyl = as.factor(data$cyl);data$carb = as.factor(data$carb); 

shinyServer(function(input, output) {
  
  #Select all the checked values, if no value make it 1
  checkedVal = reactive({
    
    vetor = as.vector(input$checkGroup)
    
    preditor = ifelse(length(vetor)>0,
                      
                      pred<-paste(vetor,collapse="+"),
                      
                      "1")
    
    lmForm = paste("mpg~",preditor,sep="") 
  }) 
  
  fitModel = reactive({
    
    fitFormula = as.formula(checkedVal())
    lm(fitFormula,data=data)
  })
  
  output$caption = renderText({
    checkedVal()
  })
  
  #regression coeffecients
  
  output$fit = renderPrint({
    summary(fitModel())$coef
  })
  
  #Plot Diagnostics
  output$mpgPlot = renderPlot({
    par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
    plot(fitModel(),sub.caption="Diagnostic Plots of the Regression")
  })
})

