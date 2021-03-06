% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ols-residual-vs-predicted-plot.R
\name{ols_rvsp_plot}
\alias{ols_rvsp_plot}
\title{Residual vs Fitted Plot}
\usage{
ols_rvsp_plot(model)
}
\arguments{
\item{model}{an object of class \code{lm}}
}
\description{
It is a scatter plot of residuals on the y axis and fitted values on the x axis to 
detect non-linearity, unequal error variances, and outliers.
}
\details{
Characteristics of a well behaved residual vs fitted plot:

\itemize{
  \item The residuals spread randomly around the 0 line indicating that the relationship is linear.
  \item The residuals form an approximate horizontal band around the 0 line indicating homogeneity of error variance.
  \item No one residual is visibly away from the random pattern of the residuals indicating that there are no outliers.
}
}
\examples{
model <- lm(mpg ~ disp + hp + wt, data = mtcars)
ols_rvsp_plot(model)
}

