source("core.R");

varInterval <- function(mean, var, n, alfa) {
  if ( n < 100) {
    chiStart 	<- qchisq(1-(alfa/2),n-1);
    chiEnd 	<- qchisq(alfa/2,n-1);
    
    start 	<- n * var / chiStart;
    end		<- n * var / chiEnd;
    
    interval(start=start,end=end)
  } else {
    z	 	<- qnorm((1-alfa/2));      
    eMax 	<- z * var * sqrt(2/n);
    start 	<- var - eMax;
    end		<- var + eMax;
    
    interval(start=start,end=end)
  }
}

varInterval2 <- function(dataDescription, alfa) {
  varInterval(dataDescription@mean,dataDescription@var, dataDescription@n, alfa)
}