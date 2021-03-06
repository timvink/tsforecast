% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/POST_FORECAST_get_forecast_accuracy_overview.R
\name{get_forecast_accuracy_overview}
\alias{get_forecast_accuracy_overview}
\title{Get forecast accuracy overview.}
\usage{
get_forecast_accuracy_overview(
  main_forecasting_table,
  metric = c("MAE", "MAPE", "MASE")
)
}
\arguments{
\item{main_forecasting_table}{A tibble containing several columns of data
required for time series forecasting, which has been created using the
\code{create_main_forecasting_table} function and which has been extended
with the fc_models and fc_errors columns using the
\code{add_fc_models_to_main_forecasting_table} function.}

\item{sort_by}{Should the fc models be sored by the mean error values
("mean"), the median error values ("median"), the minimum error values
("min") or the maximum error values ("max").}

\item{abs_error}{Boolean, which is to be set to TRUE if the absolute error
values should be used to calculate the forecast accuracy, or set to FALSE
if the error values as is should be used to calculate the forecast accuracy
(which has the problem that positive and negative errors can cancel each
other out, leading to non-intuitive conclusions about forecast accuracy).}
}
\value{
A tibble containing an overview of the overall forecast accuracy of
  each forecast model in the main_forecasting_table.
}
\description{
\code{get_forecast_accuracy_overview} is a function to create an overview of
the accuracy of the different forecast models in the main forecasting table.
The function combines the fc_errors data from all rows within the
main_forecasting_table to calculate the overall accuracy of each forecast
model for each number of periods ahead that has been forecasted.
}
\examples{
data <- tstools::initialize_ts_forecast_data(
   data = dummy_gasprice,
   date_col = "year_month",
   col_of_interest = "gasprice",
   group_cols = c("state", "oil_company")
)
main_forecasting_table <- create_main_forecasting_table(
      data = data,
      seasonal_periods = c(12,3)
   ) \%>\%
   add_fc_models_to_main_forecasting_table(
      periods_ahead = 12,
      fc_methods = c("basic", "linear")
   )
get_forecast_accuracy_overview(main_forecasting_table)
}
