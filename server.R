library(shiny)

source("description.R")
source("meanInterval.R")
source("varInterval.R")

# Define server logic required to perform the analysis
shinyServer(function(input, output) {

  # input$file will be NULL initially. After the user selects
  # and uploads a file, it will be a data frame with 'name',
  # 'size', 'type', and 'datapath' columns. The 'datapath'
  # column will contain the local filenames where the data can
  # be found.
    
  loadDataset <- reactive({
    if (is.null(input$file)) {
      return (read.csv("data/testData.dat", header=FALSE));
    } else {
      return (read.csv(input$file$datapath, header=FALSE));
    }
  });
  
  getDatasetDescription <- reactive({
    dataFrame <- loadDataset();
    data <- dataFrame[,1]
    return (describe(data));
  });

  output$distPlot <- renderPlot({
    dataFrame <- loadDataset();
    data <- dataFrame[,1]
    bins <- seq(min(data)-0.25, max(data)+0.25, by = 0.5)
    hist(data, breaks = bins, col = 'darkgray', border = 'white', main='Histogram')
    
    description <- getDatasetDescription();
    confLevel = (input$confLevel / 100);       
    meanInterval <- meanInterval2(description,1-confLevel)         
    
    abline(v=getMean(description),col="red")
    text(x=getMean(description)+0.3, y=0.5, paste("Mean = ", getMean(description)), col = 'red')
    abline(v=getStart(meanInterval),col = 'blue')
    abline(v=getEnd(meanInterval), col = 'blue')
  })
  
  output$analysis <- renderUI({ 
    confLevel = (input$confLevel / 100);            
    description <- getDatasetDescription();
    meanInterval <- meanInterval2(description,1-confLevel)
    varInterval <- varInterval2(description,1-confLevel)
    HTML(
      '<h3>Descriptive analysis:</h3>',
      '<ul>',
	'<li>Sample size: ',getSize(description),'</li>',
	'<li>Mean: ',getMean(description),'</li>',
	'<li>Variance: ',getVar(description),'</li>',
	'<li>Standard deviation: ',getStdDev(description),'</li>',
      '</ul>',
      '<h3>Inferential analysis:</h3>',
      '<ul>',
	'<li>Confidence level: ',confLevel,'</li>',
	'<li>Mean confidence interval: (',round(getStart(meanInterval),4),',',round(getEnd(meanInterval),4),')</li>',
	'<li>Variance conficende interval: (',round(getStart(varInterval),4),',',round(getEnd(varInterval),4),')</li>',
      '</ul>'            
   )
  })
  
  output$downloadSample2 <- downloadHandler(
    filename = function() { "sampleData.csv" },
    content = function(file) {
      write.table(read.csv("data/testData.dat",header=FALSE), file, col.names=FALSE, row.names=FALSE, quote=FALSE);
    }
  )  
})
 
