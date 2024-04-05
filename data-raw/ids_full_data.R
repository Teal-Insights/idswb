
# starts: -----------------------------------------------------------------
# loading necessary libraries
library(magrittr)

# loading data: -----------------------------------------------------------
# main data
ids <- readr::read_rds(file = "../../../../data/ids/ids_data_released_2024-02-29.rds")

# metadata
unique_counterpart_area <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_counterpart_area.csv"))
unique_country <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_country.csv"))
unique_series <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_series.csv"))
unique_time <- readr::read_csv(file = paste0("../../../../data/ids/", "unique_time.csv"))

# exporting data into data folder
usethis::use_data(ids, overwrite = TRUE,compress = "xz")
usethis::use_data(unique_counterpart_area, overwrite = TRUE,compress = "xz")
usethis::use_data(unique_country, overwrite = TRUE,compress = "xz")
usethis::use_data(unique_series, overwrite = TRUE,compress = "xz")
usethis::use_data(unique_time, overwrite = TRUE,compress = "xz")

# ends: -------------------------------------------------------------------


