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
    
    abline(v=description@mean,col="red")
    text(x=description@mean+0.3, y=0.5, paste("Mean = ", description@mean), col = 'red')
    abline(v=meanInterval@start,col = 'blue')
    abline(v=meanInterval@end, col = 'blue')
  })
  
  output$analysis <- renderUI({ 
    confLevel = (input$confLevel / 100);            
    description <- getDatasetDescription();
    meanInterval <- meanInterval2(description,1-confLevel)
    varInterval <- varInterval2(description,1-confLevel)
    HTML(
      '<h3>Descriptive analysis:</h3>',
      '<ul>',
	'<li>Sample size: ',description@n,'</li>',
	'<li>Mean: ',description@mean,'</li>',
	'<li>Variance: ',description@var,'</li>',
	'<li>Standard deviation: ',description@stdDev,'</li>',
      '</ul>',
      '<h3>Inferential analysis:</h3>',
      '<ul>',
	'<li>Confidence level: ',confLevel,'</li>',
	'<li>Mean confidence interval: (',round(meanInterval@start,4),',',round(meanInterval@end,4),')</li>',
	'<li>Variance conficende interval: (',round(varInterval@start,4),',',round(varInterval@end,4),')</li>',
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
 
