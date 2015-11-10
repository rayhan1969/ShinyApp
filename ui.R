
library(caret)
library(shiny)
shinyUI (
  pageWithSidebar (
    # the header is the title
    headerPanel("Computer Hardware Relative CPU Performance"),
    # the sidebar panel takes input values
    sidebarPanel(
      textInput('VendorName','Name',value='adviser'),
      numericInput('MYCT', 'Machine Cycle Time in Nanoseconds', 125, min = 17, max= 1500, step = 1),
      numericInput('MMIN', 'Minimum Main Memory in Kilobytes', 256, min = 64, max= 32000, step = 1),
      numericInput('MMAX', 'Maximum Main Memory in Kilobytes', 6000, min = 64, max= 64000, step = 10),
      numericInput('CACH', 'Cache Memory in Kilobytes', 256, min = 0, max= 256, step = 5),
      numericInput('CHMIN', 'Minimum Channels in Units', 16, min = 0, max= 52, step = 1),
      numericInput('CHMAX', 'Maximum Channels in Units', 128, min = 0, max= 176, step = 50),
      numericInput('PRP', 'Published Relative Performance', 198, min =6, max= 1150, step = 1),
      submitButton('Go')
    ),
    mainPanel (
      #main panel produces output
      h3 ("The Estimated CPU Relative Performace"),
      h3 ("Is as follows:"),
      verbatimTextOutput("calculated")
    )
  )
)




