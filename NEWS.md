# olsrr 0.2.0

This is a minor release containing bug fixes and minor improvements. 

## Bug Fixes

- inline functions in model formula caused errors in stepwise regression ([#2](https://github.com/rsquaredacademy/olsrr/issues/2))
- added variable plots (`ols_avplots`) returns error when model formula contains inline functions ([#3](https://github.com/rsquaredacademy/olsrr/issues/3))
- all possible regression (`ols_all_subset`) returns an error when the model formula contains inline functions or interaction variables ([#4](https://github.com/rsquaredacademy/olsrr/issues/4))
- best subset regression (`ols_best_subset`) returns an error when the model formula contains inline functions or interaction variables ([#5](https://github.com/rsquaredacademy/olsrr/issues/5))
- studentized residual plot (`ols_srsd_plot`) returns an error when the model formula contains inline functions ([#6](https://github.com/rsquaredacademy/olsrr/issues/6))
- stepwise backward regression (`ols_step_backward`) returns an error when the model formula contains inline functions or interaction variables ([#7](https://github.com/rsquaredacademy/olsrr/issues/7))
- stepwise forward regression (`ols_step_backward`) returns an error when the model formula contains inline functions ([#8](https://github.com/rsquaredacademy/olsrr/issues/8))
- stepAIC backward regression (`ols_stepaic_backward`) returns an error when the model formula contains inline functions ([#9](https://github.com/rsquaredacademy/olsrr/issues/9))
- stepAIC forward regression (`ols_stepaic_forward`) returns an error when the model formula contains inline functions ([#10](https://github.com/rsquaredacademy/olsrr/issues/10))
- stepAIC regression (`ols_stepaic_both`) returns an error when the model formula contains inline functions ([#11](https://github.com/rsquaredacademy/olsrr/issues/11))
- outliers incorrectly plotted in (`ols_cooksd_barplot`) cook's d bar plot ([#12](https://github.com/rsquaredacademy/olsrr/issues/12))
- regression (`ols_regress`) returns an error when the model formula contains inline functions ([#21](https://github.com/rsquaredacademy/olsrr/issues/21))
- output from step AIC backward regression (`ols_stepaic_backward`) is not properly formatted ([#22](https://github.com/rsquaredacademy/olsrr/issues/22))
- output from step AIC regression (`ols_stepaic_both`) is not properly formatted ([#23](https://github.com/rsquaredacademy/olsrr/issues/23))

## Enhancements

- cook's d bar plot (`ols_cooksd_barplot`) returns the threshold value used to classify the observations as outliers ([#13](https://github.com/rsquaredacademy/olsrr/issues/13))
- cook's d chart (`ols_cooksd_chart`) returns the threshold value used to classify the observations as outliers ([#14](https://github.com/rsquaredacademy/olsrr/issues/14))
- DFFITs plot (`ols_dffits_plot`) returns the threshold value used to classify the observations as outliers ([#15](https://github.com/rsquaredacademy/olsrr/issues/15))
- deleted studentized residuals vs fitted values plot (`ols_dsrvsp_plot`) returns the threshold value used to classify the observations as outliers ([#16](https://github.com/rsquaredacademy/olsrr/issues/16))
- studentized residuals vs leverage plot (`ols_rsdlev_plot`) returns the threshold value used to detect outliers/high leverage observations ([#17](https://github.com/rsquaredacademy/olsrr/issues/17))
- standarized residuals chart (`ols_srsd_chart`) returns the threshold value used to classify the observations as outliers ([#18](https://github.com/rsquaredacademy/olsrr/issues/18))
- studentized residuals plot (`ols_srsd_plot`) returns the threshold value used to classify the observations as outliers ([#19](https://github.com/rsquaredacademy/olsrr/issues/19))

## Documentation

There were errors in the description of the values returned by some functions. The documentation has been thoroughly revised and improved in this release.

# olsrr 0.1.0

First release.
