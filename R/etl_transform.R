
#' @title Prepares raw data to be loaded into a database
#' @description
#' Prepares raw data to be loaded into a database
#'
#' Manipulate the raw data such that it can be loaded into a database table. Usually
#' this means converting the raw data to (a series of) CSV files, which are also stored locally
#'
#' @param obj An etl object
#' @param ... arguments passed to methods
#' @method etl_transform etl_idswb
#'
#' @return Populates load directory with data
#' @export
etl_transform.etl_idswb <- function(obj, ...) {
  # pop up message to start
  message("Transforming raw data ...")
  # system sleeps for 5 seconds then proceeds
  Sys.sleep(time = 5)
  #raw dir
  files_raw <- list.files(path = file.path(attr(obj, "raw_dir")), pattern = ".csv")

  for (i in seq_along(files_raw)) {
    datafile <- readr::read_csv(file = file.path(attr(obj, "raw_dir"), files_raw[i]), show_col_types = FALSE)
    readr::write_csv(x = datafile, file = file.path(attr(obj, "load_dir"), files_raw[i]))
  }
  invisible(obj)
}
