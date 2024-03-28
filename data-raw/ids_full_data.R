
# starts: -----------------------------------------------------------------
# loading necessary libraries
library(magrittr)

# list excel files --------------------------------------------------------
excel_files <- list.files(path = '../../../../data/ids', pattern = ".xlsx")

# read excel files --------------------------------------------------------
excel_list <- list()
for (i in seq_along(excel_files)) {
  message(paste0("Reading ",excel_files[i]))
  excel_list[[i]] <- read_excel(excel_files[i])
}

df_full <- rbindlist(excel_list)

# metadata
unique_counterpart_area <- read_csv(file = "unique_counterpart_area.csv")
unique_country <- read_csv(file = "unique_country.csv")
unique_series <- read_csv(file = "unique_series.csv")
unique_time <- read_csv(file = "unique_time.csv")

# list of dataframes
ids_list = list(
  ids_wb = df_full,
  unique_counterpart_area = unique_counterpart_area,
  unique_country = unique_country,
  unique_series = unique_series,
  unique_time = unique_time
)

usethis::use_data(DATASET, overwrite = TRUE)

# ends: -------------------------------------------------------------------


