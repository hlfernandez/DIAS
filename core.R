interval <- setClass("interval", 
	representation(
		start="numeric",
		end="numeric"
)); 

setMethod("show", "interval",
  function(object){
    cat("(", getStart(object),",",getEnd(object),")","\n");
  }
)

getStart <- function(interval){
  attributes(interval)$start
}

getEnd <- function(interval){
  attributes(interval)$end
}


dataDescription <- setClass("dataDescription", 
	representation(
		n="numeric",
		mean="numeric",
		var="numeric",
		cuasiVar="numeric",
		stdDev="numeric",
		cuasiStdDev="numeric"
)); 

setMethod("show", "dataDescription",
  function(object){
    cat("Data description:\n");
    cat("n =", getSize(object),"\n");
    cat("Mean =", getMean(object),"\n");
    cat("Variance =", getVar(object),"\n");
    cat("Cuasi-variance =", getCuasiVar(object),"\n");
    cat("Std. dev. =", getStdDev(object),"\n");
    cat("Cuasi Std. dev. =", getCuasiStdDev(object),"\n");
  }
)

getSize <- function(dataDescription){
  attributes(dataDescription)$n
}

getMean <- function(dataDescription){
  attributes(dataDescription)$mean
}

getVar <- function(dataDescription){
  attributes(dataDescription)$var
}

getCuasiVar <- function(dataDescription){
  attributes(dataDescription)$cuasiVar
}

getStdDev <- function(dataDescription){
  attributes(dataDescription)$stdDev
}

getCuasiStdDev <- function(dataDescription){
  attributes(dataDescription)$cuasiStdDev
}