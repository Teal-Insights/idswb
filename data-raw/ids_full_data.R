
# starts: -----------------------------------------------------------------
# loading necessary libraries
library(magrittr)

# list excel files --------------------------------------------------------
excel_files <- list.files(path = '../../../../data/ids', pattern = ".xlsx")

# read excel files --------------------------------------------------------
excel_list <- list()
for (i in seq_along(excel_files)) {
  # pop up message
  message(paste0("Reading ",excel_files[i]))
  # reading files
  excel_list[[i]] <- readxl::read_excel(path = paste0("../../../../data/ids/",excel_files[i]))
}

# row bind a list of dataframes
df_full <- data.table::rbindlist(excel_list)

# metadata
unique_counterpart_area <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_counterpart_area.csv"))
unique_country <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_country.csv"))
unique_series <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_series.csv"))
unique_time <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_time.csv"))

# list of dataframes
ids_full_data = list(
  ids_wb = df_full,
  unique_counterpart_area = unique_counterpart_area,
  unique_country = unique_country,
  unique_series = unique_series,
  unique_time = unique_time
)

# exporting to ins/extdata directory
base::save(ids_full_data,file = "inst/extdata/ids_full_data.rds", compress = "xz")

# exporting data into data folder
usethis::use_data(ids_full_data, overwrite = TRUE,compress = "xz")

# ends: -------------------------------------------------------------------


