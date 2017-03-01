% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ols-stepwise-backward-regression.R
\name{ols_step_backward}
\alias{ols_step_backward}
\alias{plot.ols_step_backward}
\title{Stepwise Backward Regression}
\usage{
ols_step_backward(model, ...)

\method{plot}{ols_step_backward}(x, model = NA, ...)
}
\arguments{
\item{model}{an object of class \code{lm}}

\item{...}{other inputs}

\item{x}{an object of class \code{ols_step_backward}}
}
\value{
\code{ols_step_backward} returns an object of class \code{"ols_step_backward"}.
An object of class \code{"ols_step_backward"} is a list containing the
following components:

\item{steps}{f statistic}
\item{removed}{p value of \code{score}}
\item{rsquare}{degrees of freedom}
\item{aic}{fitted values of the regression model}
\item{sbc}{name of explanatory variables of fitted regression model}
\item{sbic}{response variable}
\item{adjr}{predictors}
\item{rmse}{predictors}
\item{mallows_cp}{predictors}
\item{indvar}{predictors}
}
\description{
Build regression model from a set of candidate predictor variables by removing predictors based on 
p values, in a stepwise manner until there is no variable left to remove any more.
}
\examples{
# stepwise backward regression
model <- lm(y ~ ., data = surgical)
ols_step_backward(model)

# stepwise backward regression plot
model <- lm(y ~ ., data = surgical)
k <- ols_step_backward(model)
plot(k)

}
\references{
Chatterjee, Samprit and Hadi, Ali. Regression Analysis by Example. 5th ed. N.p.: John Wiley & Sons, 2012. Print.
}
