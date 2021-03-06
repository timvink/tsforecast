% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CONFIG.R
\name{supported_fc_methods}
\alias{supported_fc_methods}
\alias{supported_fc_methods_uni_var}
\alias{supported_fc_methods_multi_var}
\title{Supported forecast models}
\usage{
supported_fc_methods_uni_var()

supported_fc_methods_multi_var()
}
\value{
\item{supported_fc_methods_uni_var()}{c("basic", "linear", "holt_winters", "bats", "ets", "arima", "nn", "prophet", "tree", "forest", "ensemble", "svm", "recursive", "kalman", "fforma)}

\item{supported_fc_methods_multi_var()}{c("linear", "arima", "nn", "prophet", "tree", "forest", "svm", "recursive")}
}
\description{
\code{supported_fc_methods_uni_var} returns all available models for univariate forcasting.
\code{supported_fc_methods_multi_var} returns all available models for multivariate forcasting.
}
