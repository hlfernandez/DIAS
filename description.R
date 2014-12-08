source("core.R");

describe <- function(X) {
  n		<- length(X)
  mean 		<- mean(X)
  cuasiVar 	<- var(X)
  cuasiStdDev 	<- sqrt(cuasiVar)
  var 		<- cuasiVar * (n-1) / n
  stdDev	<- sqrt(var)
  
  dataDescription(
    n=n,
    mean=mean,
    var=var,
    cuasiVar=cuasiVar,
    stdDev=stdDev,
    cuasiStdDev=cuasiStdDev)
}
