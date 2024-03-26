
#' etl_transform
#' @export
#' @rdname etl_extract.etl_idswb
#' @method etl_transform etl_idswb
#' @import dplyr
#' @import etl
#' @importFrom readr write_delim read_csv
#' @importFrom lubridate year month
#' @inheritParams etl::etl_extract
#' @details This function transforms NYC311 data for years and months specified.
#'
etl_transform.etl_idswb <- function(obj, ...) {
  # pop up message to start
  message("Transforming raw data ...")
  Sys.sleep(time = 5)
  #raw dir
  files_raw <- list.files(path = file.path(attr(obj, "raw_dir")), pattern = ".csv")

  for (i in seq_along(files_raw)) {
    datafile <- readr::read_csv(file = file.path(attr(obj, "raw_dir"), files_raw[i]))
    readr::write_csv(x = datafile, file = file.path(attr(obj, "load_dir"), files_raw[i]))
  }
  invisible(obj)
}
