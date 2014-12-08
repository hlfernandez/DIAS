source("core.R")
source("meanInterval.R")
source("varInterval.R")
 
mean 	= 6
var 	= 4
conf 	= 0.95
n	= 35

mean 	= 15
var 	= 9
conf 	= 0.95
n	= 122

meanInterval 		= meanInterval(mean,var,n,1-conf)
varianceInterval 	= varInterval(mean,var,n,1-conf)

cat("Mean = "		, mean, "\n")
cat("Variance = "	, var, "\n")
cat("n = "		, n, "\n")
cat("Conf. level = "	, conf, "\n")
cat("Mean confidence interval = ("	,attributes(meanInterval)$start,","	,attributes(meanInterval)$end,")\n")
cat("Variance confidence interval = ("	,attributes(varianceInterval)$start,","	,attributes(varianceInterval)$end,")\n")