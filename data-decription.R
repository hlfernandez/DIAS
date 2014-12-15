source("description.R")
source("meanInterval.R")
source("varInterval.R")

testData 	<- read.csv("data/testData.dat", header=FALSE)

description 	<- describe(testData[,1])
meanInterval 	<- meanInterval2(description,1-0.95)
varInterval 	<- varInterval2(description,1-0.95)

print(description)
print(meanInterval)
print(varInterval)