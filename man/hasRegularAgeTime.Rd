% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGeneric.R, R/DemographicArray-methods.R,
%   R/MetaData-methods.R
\name{hasRegularAgeTime}
\alias{hasRegularAgeTime}
\alias{hasRegularAgeTime,DemographicArray-method}
\alias{hasRegularAgeTime,MetaData-method}
\title{Age steps and time steps of demographic array.}
\usage{
hasRegularAgeTime(object)

\S4method{hasRegularAgeTime}{DemographicArray}(object)

\S4method{hasRegularAgeTime}{MetaData}(object)
}
\arguments{
\item{object}{Object of class \code{\linkS4class{DemographicArray}}.}
}
\value{
\code{TRUE} or an error.
}
\description{
\code{hasRegularAgeTime} tests whether an object has a "regular" age-time
plan, where regular means that all age steps and/or time steps have the same
length.  If an object does have a regular age-time plan, then
\code{ageTimeStep} returns then length of the age and/or time steps.
}
\details{
Functions such as \code{\link{ageTimeStep}} and \code{\link{rotateAgeTime}}
can only be applied to objects that have regular age-time plans.

Step lengths equals the widths of the intervals if a dimension has
\code{\link{dimscale}} \code{"Intervals"}, and the distance between points
if the dimension has \code{\link{dimscale}} \code{"Points"}.  Any 'open'
intervals (ie intervals beginning with \code{-Inf} or ending with
\code{Inf}) are ignored.

An 'age step' is a step along a dimension with \code{\link{dimtype}}
\code{"age"}, and a 'time step' is a step along a dimension with dimtype
\code{"time"}.

If \code{object} has both an age dimension and a time dimension, then the
age steps and time steps must all be equal for the age-time plan to be
regular.

If \code{object} does not have either an age dimension or a time dimension,
then it is regular.  However, \code{ageTimeStep} throws an error.
}
\examples{
library(demdata)
x <- Counts(VAPopn)
x
hasRegularAgeTime(x)
ageTimeStep(x)

x <- Counts(occupationalStatus)
x
hasRegularAgeTime(x)
\dontrun{ageTimeStep(x)} ## no age or time dimensions

a <- array(rnorm(3),
           dim = 3,
           dimnames = list(year = c(2000, 2005, 2020)))
x <- Values(a)
\dontrun{hasRegularAgeTime}
}
\seealso{
\code{\linkS4class{DemographicArray}}, \code{\link{dimtypes}},
\code{\link{dimscales}}, FUNCTIONS REQUIRE REGULAR.
}
