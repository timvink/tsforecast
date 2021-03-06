% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HELPER_get_ts_features.R
\name{get_ts_features}
\alias{get_ts_features}
\title{Extract time series features}
\usage{
get_ts_features(ts_object)
}
\arguments{
\item{ts_object}{A time series object. It is assumed to have been the outcome
of a process from initializing the original dataset with
\code{initialize_ts_forecast_data} from tstools and eventually into ts_object_train in
\code{create_main_forecasting_table}.}
}
\value{
A tibble that has 60 features of the input. See Hyndman's
  \href{https://cran.r-project.org/web/packages/tsfeatures/vignettes/tsfeatures.html}{tsfeatures
   package vignette} for information on the features themselves
}
\description{
\code{get_ts_features} gets a time series object and extracts multiple
features from it.
}
\examples{
ts_object <- dummy_gasprice \%>\%
      tstools::initialize_ts_forecast_data(
      date_col = "year_month",
      col_of_interest = "gasprice",
      group_cols = c("oil_company", "state"),
      xreg_cols = c("gemprice")
   ) \%>\%
   create_main_forecasting_table(
      min_train_periods = 25
   ) \%>\%
   dplyr::slice(1:1) \%>\%
   dplyr::pull(ts_object_train)
get_ts_features(ts_object)
}
