% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGeneric.R, R/DemographicArray-methods.R,
%   R/numeric-methods.R
\name{coerce-data}
\alias{coerce-data}
\alias{toDouble}
\alias{toInteger}
\alias{toDouble,DemographicArray-method}
\alias{toInteger,DemographicArray-method}
\alias{toDouble,numeric-method}
\alias{toInteger,integer-method}
\alias{toInteger,numeric-method}
\title{Coerce to numeric or integer.}
\usage{
toDouble(object)

toInteger(object, force = FALSE)

\S4method{toDouble}{DemographicArray}(object)

\S4method{toInteger}{DemographicArray}(object, force = FALSE)

\S4method{toDouble}{numeric}(object)

\S4method{toInteger}{integer}(object, force = FALSE)

\S4method{toInteger}{numeric}(object, force = FALSE)
}
\arguments{
\item{object}{An object of class \code{\linkS4class{DemographicArray}} or a
numeric vector.}

\item{force}{\code{TRUE} or \code{FALSE} (the default).}
}
\description{
Function \code{toInteger} uses \code{\link{round}} followed by
\code{\link{as.integer}} to coerce the data part of a
\code{\linkS4class{DemographicArray}} object to type \code{"integer"}.
Function \code{toDouble} uses \code{\link{as.double}} to coerce to type
\code{"double"}.  If the coercion to type \code{"integer"} requires
rounding, then an error is raised, unless \code{force} is \code{TRUE}.
}
\examples{
## A demographic array.
x <- Counts(array(c(1, 2, 3, 4),
                  dim = c(2, 2),
                  dimnames = list(sex = c("Female", "Male"),
                      region = c("a", "b"))))

## x consists entirely of whole numbers,
## but has type "double", not "integer":
is.integer(x)
x <- toInteger(x)
is.integer(x)
x[1] <- 1.1

## rounding is required, so 'toInteger' won't work
\dontrun{toInteger(x)}
## ...unless 'force' is TRUE
toInteger(x, force = TRUE)

## A numeric vector
x <- c(1, 2, 3)
is.integer(x)
x <- toInteger(x)
x
is.integer(x)
x <- toDouble(x)
x
is.integer(x)
}
\seealso{
\code{\link{as.integer}}, which, unlike \code{toInteger}, removes
all attributes.
}
