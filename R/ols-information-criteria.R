#' @importFrom stats logLik
#' @title AIC
#' @description Akaike Information Criteria
#' @param model an object of class \code{lm}
#' @param method a character vector; specify the method to compute AIC. Valid
#' options include R, STATA and SAS
#' @return Akaike Information Criteria
#' @references Akaike, H. (1969). “Fitting Autoregressive Models for Prediction.” Annals of the Institute of Statistical
#' Mathematics 21:243–247.
#'
#' Judge, G. G., Griffiths, W. E., Hill, R. C., and Lee, T.-C. (1980). The Theory and Practice of Econometrics.
#' New York: John Wiley & Sons.
#' @examples 
#' # using R computation method
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_aic(model)
#' 
#' # using STATA computation method
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_aic(model, method = 'STATA')
#' 
#' # using SAS computation method
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_aic(model, method = 'SAS')
#' @export
#'
ols_aic <- function(model, method = c("R", "STATA", "SAS")) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	method <- match.arg(method)
	n      <- nrow(model.frame(model))
	p      <- length(model$coefficients)

	if (method == "R") {

		p      <- p + 1
		lk     <- logLik(model)
		akaike <- -2 * lk[1] + 2 * p

	} else if (method == "STATA") {

		lk     <- logLik(model)
		akaike <- -2 * lk[1] + 2 * p

	} else if (method == 'SAS') {

		sse    <- sum(residuals(model) ^ 2)
		akaike <- n * log(sse / n) + 2 * p

	} else {

		message("Please specify a valid method.")

	}

	akaike <- round(akaike, 4)
	return(akaike)

}


# bayesian information criterion (sbc in sas)
#' @title SBC
#' @description Bayesian Information Criteria
#' @param model an object of class \code{lm}
#' @param method a character vector; specify the method to compute AIC. Valid
#' options include R, STATA and SAS
#' @return Bayesian Information Criteria
#' @references Schwarz, G. (1978). “Estimating the Dimension of a Model.” Annals of Statistics 6:461–464.
#'
#' Judge, G. G., Griffiths, W. E., Hill, R. C., and Lee, T.-C. (1980). The Theory and Practice of Econometrics.
#' New York: John Wiley & Sons.
#' @examples 
#' # using R computation method
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_sbc(model)
#' 
#' # using STATA computation method
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_sbc(model, method = 'STATA')
#' 
#' # using SAS computation method
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_sbc(model, method = 'SAS')
#' @export
#'
ols_sbc <- function(model, method = c("R", "STATA", "SAS")) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	n      <- nrow(model.frame(model))
	p      <- length(model$coefficients)
	method <- match.arg(method)

	if (method == "R") {

		p        <- p + 1
		lk       <- logLik(model)
		bayesian <- -2 * lk[1] + log(n) * p

	} else if (method == "STATA") {

		lk       <- logLik(model)
		bayesian <- -2 * lk[1] + log(n) * p

	} else if (method == 'SAS') {

		sse      <- sum(residuals(model) ^ 2)
		bayesian <- n * log(sse / n) + p * log(n)

	} else {

		message("Please specify a valid method.")

	}

	bayesian <- round(bayesian, 4)
	return(bayesian)
}


# sawa's bayesian information criteria
#' @title SBIC
#' @description Sawa's Bayesian Information Criteria
#' @param model an object of class \code{lm}
#' @param full_model an object of class \code{lm}
#' options include R, STATA and SAS
#' @return Sawa's Bayesian Information Criteria
#' @references Sawa, T. (1978). “Information Criteria for Discriminating among Alternative Regression Models.” Econometrica
#' 46:1273–1282.
#'
#' Judge, G. G., Griffiths, W. E., Hill, R. C., and Lee, T.-C. (1980). The Theory and Practice of Econometrics.
#' New York: John Wiley & Sons.
#' @examples
#' full_model <- lm(mpg ~ ., data = mtcars)
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_sbic(model, full_model)
#' @export
#'
ols_sbic <- function(model, full_model) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

  if (!all(class(full_model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

  # if (!all(names(model$coefficients) %in% names(fullmodel$coefficients))) {
  # 	stop('model must be a subset of full model')
  # }

	n <- model %>% model.frame() %>% nrow()
	# p <- model %>% coefficients() %>% length()
	p <- model %>% anova() %>% `[[`(1) %>% length()
	r <- full_model %>% model.frame() %>% length()
	q <- n * (q1(full_model, r) / q2(model, p))
	result <- sbicout(model, n, p, q)

	return(result)

}


# mallow's cp
#' @title Mallow's Cp
#' @description Mallow's Cp
#' @param model an object of class \code{lm}
#' @param fullmodel an object of class \code{lm}
#' @return Mallow's Cp
#' @references Hocking, R. R. (1976). “The Analysis and Selection of Variables in a Linear Regression.” Biometrics
#' 32:1–50.
#'
#' Mallows, C. L. (1973). “Some Comments on Cp.” Technometrics 15:661–675.
#' @examples
#' full_model <- lm(mpg ~ ., data = mtcars)
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_mallows_cp(model, full_model)
#' @export
#'
ols_mallows_cp <- function(model, fullmodel) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

  if (!all(class(fullmodel) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

  if (!all(names(model$coefficients) %in% names(fullmodel$coefficients))) {
  	stop('model must be a subset of full model')
  }

		n <- model %>% model.frame() %>% nrow()
		# p <- model %>% coefficients() %>% length()
		p <- model %>% anova() %>% `[[`(1) %>% length()
		q <- fullmodel %>% model.frame() %>% length()
	mcp <- mcpout(model, fullmodel, n, p, q)
	return(mcp)

}



# gmsep : estimated error of prediction, assuming multivariate normality
#' @title MSEP
#' @description Estimated error of prediction, assuming multivariate normality
#' @param model an object of class \code{lm}
#' @return MSEP
#' @references Stein, C. (1960). “Multiple Regression.” In Contributions to Probability and Statistics: Essays in Honor
#' of Harold Hotelling, edited by I. Olkin, S. G. Ghurye, W. Hoeffding, W. G. Madow, and H. B. Mann,
#' 264–305. Stanford, CA: Stanford University Press.
#'
#' Darlington, R. B. (1968). “Multiple Regression in Psychological Research and Practice.” Psychological
#' Bulletin 69:161–182.
#' @examples
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_msep(model)
#' @export
#'
ols_msep <- function(model) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	result <- sepout(model)
	return(result)
}


#' @title Final Prediction Error
#' @description Final prediction error
#' @param model an object of class \code{lm}
#' @return fpe 
#' @references Akaike, H. (1969). “Fitting Autoregressive Models for Prediction.” Annals of the Institute of Statistical
#' Mathematics 21:243–247.
#'
#' Judge, G. G., Griffiths, W. E., Hill, R. C., and Lee, T.-C. (1980). The Theory and Practice of Econometrics.
#' New York: John Wiley & Sons.
#' @examples
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_fpe(model)
#' @export
#'
ols_fpe <- function(model) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	return(jpout(model))

}


#' @title Amemiya's Prediction Criteria
#' @description Amemiya's prediction error
#' @param model an object of class \code{lm}
#' @return Amemiya's prediction error
#' @references Amemiya, T. (1976). Selection of Regressors. Technical Report 225, Stanford University, Stanford, CA.
#'
#' Judge, G. G., Griffiths, W. E., Hill, R. C., and Lee, T.-C. (1980). The Theory and Practice of Econometrics.
#' New York: John Wiley & Sons.
#' @examples
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_apc(model)
#' @export
#'
ols_apc <- function(model) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	return(pcout(model))

}


#' @title Hocking's SP
#' @description Average prediction mean squared error
#' @param model an object of class \code{lm}
#' @return Hocking's SP
#' @references Hocking, R. R. (1976). “The Analysis and Selection of Variables in a Linear Regression.” Biometrics
#' 32:1–50.
#' @examples
#' model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
#' ols_hsp(model)
#' @export
#'
ols_hsp <- function(model) {

	if (!all(class(model) == 'lm')) {
    stop('Please specify a OLS linear regression model.', call. = FALSE)
  }

	return(spout(model))

}