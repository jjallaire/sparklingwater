
# https://github.com/h2oai/sparkling-water/blob/master/core/src/main/scala/org/apache/spark/h2o/H2OContext.scala

#' Get or create the H2OContext for a SparkContext
#'
#' @param sc A \code{spark_connection}
#'
#' @export
h2o_context <- function(sc) {
  invoke_static(sc, "org.apache.spark.h2o.H2OContext", "getOrCreate", spark_context(sc))
}

#' Open the H2O Flow UI in a browser
#'
#' @inheritParams h2o_context
#'
#' @export
h2o_flow <- function(sc) {
  flow <- invoke(h2o_context(sc), "h2oLocalClient")
  utils::browseURL(paste0("http://", flow))
}

#' Convert a Spark DataFrame to an H2O Frame
#'
#' df A \code{spark_dataframe}
#'
#' @keywords internal
#'
#' @export
h2o_frame <- function(df) {

  # ensure we are dealing with a spark data frame (might be e.g. a tbl)
  # and get the underlying spark_connection
  df <- spark_dataframe(df)
  sc <- spark_connection(df)

  # convert to h2o_frame
  h2o_context(sc) %>% invoke("asH2OFrame", df)
}



