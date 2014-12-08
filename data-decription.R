source("description.R")
source("meanInterval.R")
source("varInterval.R")

# X = c(4,4,4,5,5,5,6,6,6)
# description <- describe(X)

testData <- read.csv("testData.dat")
description <- describe(testData$grade2)
meanInterval <- meanInterval2(description,1-0.95)
varInterval <- varInterval2(description,1-0.95)