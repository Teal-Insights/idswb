#' etl_extract
#' @rdname etl_extract.etl_idswb
#' @method etl_extract etl_idswb
#' @import etl
#' @import dplyr
#' @importFrom rvest html_nodes html_text
#' @importFrom xml2 read_html
#' @importFrom utils download.file
#' @importFrom lubridate year month days parse_date_time
#' @inheritParams etl::etl_extract
#' @details This function downloads International Debt statistics data
#' in the raw directory under the folder the user created
#' @export
etl_extract.etl_idswb <- function(obj, ...) {
  message("Extracting raw data...")
  # loading data
  ids_path <- system.file("data", "ids_full_data.rds", package = "idswb")
  ids_full_data <- readRDS(file = ids_path)

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
