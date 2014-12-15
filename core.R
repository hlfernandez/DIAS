# Represents an (start,end) interval
interval <- setClass("interval", 
  representation(
    start="numeric",
    end="numeric"
)); 

# Set show method for interval class
setMethod("show", "interval",
  function(object){
    cat("(", object@start,",",object@end,")","\n");
  }
)

# Class dataDescription encloses descriptive measures
dataDescription <- setClass("dataDescription", 
  representation(
    n="numeric",
    mean="numeric",
    var="numeric",
    cuasiVar="numeric",
    stdDev="numeric",
    cuasiStdDev="numeric"
)); 

# Set show method for dataDescription class
setMethod("show", "dataDescription",
  function(object){
    cat("Data description:\n");
    cat("n =", object@n,"\n");
    cat("Mean =", object@mean,"\n");
    cat("Variance =", object@var,"\n");
    cat("Cuasi-variance =", object@cuasiVar,"\n");
    cat("Std. dev. =", object@stdDev,"\n");
    cat("Cuasi Std. dev. =", object@cuasiStdDev,"\n");
  }
)