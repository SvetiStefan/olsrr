% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ols-dfbetas-panel.R
\name{ols_dfbetas_panel}
\alias{ols_dfbetas_panel}
\title{DFBETAs Panel}
\usage{
ols_dfbetas_panel(model)
}
\arguments{
\item{model}{an object of class \code{lm}}
}
\value{
list; \code{ols_dfbetas_panel} returns a list of tibbles (for intercept and each predictor)
with the observation number and DFBETA of observations that exceed the threshold for classifying
an observation as an outlier/influential observation.
}
\description{
Panel of plots to detect influential observations using DFBETAs.
}
\details{
DFBETA measures the difference in each parameter estimate with and without the
influential point. There is a DFBETA for each data point i.e if there are n observations
and k variables, there will be \eqn{n * k} DFBETAs. In general, large values of DFBETAS indicate 
observations that are influential in estimating a given parameter. Belsley, Kuh, and Welsch recommend 
2 as a general cutoff value to indicate influential observations and \eqn{2/\sqrt(n)} as a size-adjusted cutoff.
}
\examples{
model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
ols_dfbetas_panel(model)
}
\references{
Belsley, David A.; Kuh, Edwin; Welsh, Roy E. (1980). Regression 
Diagnostics: Identifying Influential Data and Sources of Collinearity. 
Wiley Series in Probability and Mathematical Statistics. 
New York: John Wiley & Sons. pp. ISBN 0-471-05856-4.
}

