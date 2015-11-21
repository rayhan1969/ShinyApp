
library(caret)
library(shiny)
library(UsingR)
library(RCurl)
#code outside gets run only once outside of function
CompHardware <- read.csv(file = 'data.csv', header=F)
names(CompHardware) <- c("VendorName", "ModelName", "MYCT", "MMIN", "MMAX", "CACH", "CHMIN", "CHMAX",
                         "PRP", "ERP")
FittedModel <- train(ERP ~ VendorName+ MYCT + MMIN + MMAX + CACH + CHMIN + CHMAX + PRP
                     , method="glm", data=CompHardware)
shinyServer(
  function(input, output){ 
    #code inside function but not in reactive run once for every user or page #refresh
    #code in reactive function gets run repeatedly as needed when new values are #entered
    output$calculated <- renderPrint({
      VendorName = input$VendorName
      MYCT = input$MYCT
      MMIN = input$MMIN
      MMAX = input$MMAX
      CACH = input$CACH
      CHMIN = input$CHMIN
      CHMAX = input$CHMAX
      PRP = input$PRP
      predict(FittedModel,data.frame(VendorName, MYCT, MMIN, MMAX, CACH, CHMIN, CHMAX, PRP))})
  }
)

