% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGeneric.R, R/CountsWithSubtotals-methods.R
\name{subtotals}
\alias{subtotals}
\alias{subtotals,CountsWithSubtotals-method}
\title{Get subtotals attached to a Counts object.}
\usage{
subtotals(object)

\S4method{subtotals}{CountsWithSubtotals}(object)
}
\arguments{
\item{object}{An object of class \code{\linkS4class{CountsWithSubtotals}}.}
}
\description{
Extract the subtotals used by an object of class
\code{\linkS4class{CountsWithSubtotals}}.
}
\examples{
library(demdata)
popn <- Counts(VAPopn)
popn <- extrapolate(popn, along = "age", labels = "45-49", type = "missing")
subtotals <- Counts(array(c(65000, 64000),
                          dim = 1:2,
			  dimnames = list(age = "45-49", sex = c("Male", "Female"))))
popn <- attachSubtotals(popn, subtotals = subtotals)
subtotals(popn)
}
