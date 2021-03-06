\name{isUnivariate}


\title{Checks if a Time Series is Univariate}


\alias{isUnivariate}
\alias{isMultivariate}


\description{
    
    Checks if a time series o bject or any other
    rectangular object is univariate or multivariate.       
}


\usage{
isUnivariate(x)
isMultivariate(x)
}


\arguments{
   
    \item{x}{ 
        an object of class \code{timeSeries} or any other rectangular 
        object.
        }

}


\value{

    \code{isUnivariate}\cr
    \code{isMultivariate}\cr
    \cr
    return a logical depending if the test is true or not.
        
}


\details{

    A rectangular object \code{x} is considered to be univariate if 
    the function \code{NCOL(x)} returns one, and is considered to be
    multivariate if \code{NCOL(x)} returns a value bigger than one.

}


\examples{
## Load Microsoft Data - 
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   Open = MSFT[, "Open"]
  
## Is the timeSeries Univariate - 
   isUnivariate(MSFT)
   isUnivariate(Open)

## Is the timeSeries Multivariate -   
   isMultivariate(MSFT)
   isMultivariate(Open)
}


\keyword{chron}

