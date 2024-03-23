#' etl_extract
#' @export
#' @rdname etl_extract.etl_idswb
#' @method etl_extract etl_idswb
#' @import dplyr
#' @import etl
#' @importFrom utils download.file
#' @importFrom lubridate year month
#' @inheritParams etl::etl_extract
#' @param years years that the issues have been created (the most recent year is the default)
#' @param months months that the issues have been created (the most recent month is the default)
#' @param num_calls number of readings (1000000 is the default)
#' @param ... arguments passed to \code{\link{download.file}}. Set method as "curl" for Linux system, and as default for Windows and Mac OS X systems.
#' @details This function downloads idswb data from idswb OPEN DATA website for years and months specified.
etl_extract.etl_idswb <- function(obj, ...) {
  message("Extracting raw data...")
  raw_filename <- file.path(attr(obj, "raw_dir"), "mtcars.csv")
  datasets::mtcars %>%
    tibble::rownames_to_column("model") %>%
    readr::write_csv(file = raw_filename)
  invisible(obj)
}
