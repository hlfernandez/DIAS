source("core.R");

meanInterval <- function(mean, var, n, alfa) {
  t 	<- qt((1-alfa/2),n-1);      
  eMax 	<- t * sqrt(var)  / sqrt(n-1);
  start <- mean - eMax;
  end	<- mean + eMax;
  
  interval(start=start,end=end)
}

meanInterval2 <- function(dataDescription, alfa) {
  meanInterval(dataDescription@mean,dataDescription@var, dataDescription@n, alfa)
}

