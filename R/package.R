
#' @import sparkapi
NULL

# define required spark packages
spark_dependencies <- function(...) {
  spark_dependency(packages = c("ai.h2o:sparkling-water-core_2.10:1.6.5",
                                "ai.h2o:sparkling-water-ml_2.10:1.6.5"))
}

