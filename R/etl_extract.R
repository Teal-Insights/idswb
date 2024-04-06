#' @title Extracts data and stores it locally in its raw form
#' @description
#' Downloads data and stores it locally in its raw form
#' @rdname etl_extract.etl_idswb
#' @method etl_extract etl_idswb
#' @import etl
#' @import dplyr
#' @param obj an etl object
#' @param ... arguments passed to methods
#' @export
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
