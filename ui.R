library(shiny)

shinyUI(fluidPage(
  titlePanel("Wellcome to DIAS!"),

  # Sidebar with a controls panel and a main panel with output
  sidebarLayout(
    sidebarPanel(    
      h4("Descriptive and Inferential Statistical Analysis for one Sample"),
      tags$hr(),      
      
      h3("Input data"),
      fileInput('file', 'Choose the file containing your sample data:',
	accept=c('text/csv', 'text/comma-separated-values,text/plain','.csv')
	),          
        
      sliderInput(
	"confLevel",
        "Confidence level:",
        min = 1,
        max = 100,
        value = 95
      ),
      
      tags$hr(),      
      h4("Data format"),
      helpText("A plain text file with one observation per row"),
      pre("
	1
	2
	3"
      ),
      downloadButton("downloadSample2", "Download sample data")
     ),     
      
    mainPanel(
      htmlOutput("analysis"),
      plotOutput("distPlot")      
    )
  )
))
 
