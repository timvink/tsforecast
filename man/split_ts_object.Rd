% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/HELPER_split_ts_object.R
\name{split_ts_object}
\alias{split_ts_object}
\title{Split ts object into two parts}
\usage{
split_ts_object(
  ts_object,
  ts_split_date,
  output = c("both", "train", "valid"),
  max_length = Inf
)
}
\arguments{
\item{ts_object}{A time series object to be split into two.}

\item{ts_split_date}{A date object or period value (in yyyymm numeric format)
indicating the date at which to split the time series object into two.}

\item{output}{What kind of output is wanted from the split, either 'train'
(which is the time range before and on the split date), 'valid' (which is
the time range after the split date) or 'both'.}

\item{max_length}{A positive integer value indicating the maximum length the
resulting ts object should be. This is in case the ts object requires
trimming, e.g. to limit the historic data used for training.}
}
\value{
Depending on the value for the 'output' parameter: \itemize{
  \item{'train'}{ - ts object containing the time range before and on the
  split date} \item{'valid'}{ - ts object containing the time range after the
  split date} \item{'both'}{ - named list containing both of the above
  objects} }
}
\description{
\code{split_ts_object} is a function to split a time series object into two
parts based on a specified split date. The two parts can then be used
separately, e.g. one part for training a time series model and the other part
for validation of the model.
}
\examples{
ts_object <- tstools::initialize_ts_forecast_data(
      data = dummy_gasprice,
      date_col = "year_month",
      col_of_interest = "gasprice",
      group_cols = c("state", "oil_company"),
      xreg_cols = c("spotprice", "gemprice")
   ) \%>\%
   dplyr::filter(grouping == "state = New York   &   oil_company = CompanyA") \%>\%
   tstools::transform_data_to_ts_object(seasonal_periods = 3)
ts_train_data <- split_ts_object(
   ts_object = ts_object,
   ts_split_date = 200101,
   output = "train",
   max_length = Inf
)
}
