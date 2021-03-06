% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ols-stepaic-backward-regression.R
\name{ols_stepaic_backward}
\alias{ols_stepaic_backward}
\alias{ols_stepaic_backward.default}
\alias{plot.ols_stepaic_backward}
\title{Stepwise AIC Backward Regression}
\usage{
ols_stepaic_backward(model, ...)

\method{ols_stepaic_backward}{default}(model, details = FALSE, ...)

\method{plot}{ols_stepaic_backward}(x, ...)
}
\arguments{
\item{model}{an object of class \code{lm}; the model should include all candidate predictor variables}

\item{...}{other arguments}

\item{details}{logical; if \code{TRUE}, will print the regression result at each step}

\item{x}{an object of class \code{ols_stepaic_backward}}
}
\value{
\code{ols_stepaic_backward} returns an object of class \code{"ols_stepaic_backward"}.
An object of class \code{"ols_stepaic_backward"} is a list containing the
following components:

\item{steps}{total number of steps}
\item{predictors}{variables removed from the model}
\item{aics}{akaike information criteria}
\item{ess}{error sum of squares}
\item{rss}{regression sum of squares}
\item{rsq}{rsquare}
\item{arsq}{adjusted rsquare}
}
\description{
Build regression model from a set of candidate predictor variables by removing predictors based on 
Akaike Information Criteria, in a stepwise manner until there is no variable left to remove any more.
}
\examples{
# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_stepaic_backward(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_stepaic_backward(model)
plot(k)

}
\references{
Venables, W. N. and Ripley, B. D. (2002) Modern Applied Statistics with S. Fourth edition. Springer.
}

