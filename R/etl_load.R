
#' Load the transformed data into the database.
#'
#' @param obj An etl object
#' @param ... arguments passed to methods
#'
#' @return Loads data from load directory into database
#' @export
#'
etl_load.etl_idswb <- function(obj, ...) {
  path = list.files(path = file.path(attr(obj, "load_dir")), pattern = "\\.csv", full.names = TRUE)
  table = list.files(path = file.path(attr(obj, "load_dir")), pattern = "\\.csv") %>% stringr::str_remove(pattern = ".csv")
  # source dataframe
  src <- data.frame(path = path, table = table)
  # write to Table
  message("Loading data to the database...")

  # writind data to database
  files_raw <- list.files(path = file.path(attr(obj, "load_dir")), pattern = ".csv")

  for (i in seq_along(files_raw)) {
    datafile <- readr::read_csv(file = file.path(attr(obj, "load_dir"), files_raw[i]), show_col_types = FALSE)
    DBI::dbWriteTable(conn = obj$con, name = table[i], value = datafile)
  }
  # invisible
  invisible(obj)
}
