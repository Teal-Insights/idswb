#' Extract data from the Internet and store it locally in its raw form
#'
#' @param obj An etl object
#' @param ... arguments passed to methods
#'
#' @return Populates raw directory with data
#' @export
#'
etl_extract.etl_idswb <- function(obj, ...) {
  message("Extracting raw data...")

  # loading data
  df_full = idswb::ids
  unique_counterpart_area <- idswb::unique_counterpart_area
  unique_country <- idswb::unique_country
  unique_series <- idswb::unique_series
  unique_time <- idswb::unique_time

  # list of dataframes
  ids_full_data = list(
    ids_wb = df_full,
    unique_counterpart_area = unique_counterpart_area,
    unique_country = unique_country,
    unique_series = unique_series,
    unique_time = unique_time
  )

  # loop each file in the list
  ids_files <- names(ids_full_data)
  ids_file_names = file.path(attr(obj, "raw_dir"), paste0(ids_files,".csv"))

  for (i in seq_along(ids_files)) {
    # subset data
    ids_data <- ids_full_data[[i]]
    # export raw data
    readr::write_csv(x = ids_data, file = ids_file_names[i])
  }
  # invisible
  invisible(obj)
}
