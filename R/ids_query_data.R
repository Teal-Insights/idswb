utils::globalVariables(c("data_last_updated","api_code", "wb_creditor_name", "wb_debtor_country_name", "year"))

#' @title Query debt data
#' @description
#' Query debt information for a given country (debtor) that it owes to any creditor.
#' The default creditors are both China and the World
#'
#' @param etl_object An `etl` object
#' @param debtor Debtor name(s)
#' @param creditor Creditor name(s)
#' @param series A vector of Series
#'
#' @return Returns a tibble showing how debtor owes to any creditor. The default creditors are both China and the World
#' @export
#'
ids_query_data <- function(etl_object, debtor, creditor = c("China","World"), series){
  # ignore columns
  columns_ignore <- c("api_code", "data_last_updated", "series_full_name", "wb_debtor_country_name", "wb_debtor_country_id",
                      "wb_creditor_name", "wb_creditor_id")
  data <- dplyr::tbl(src = etl_object, "ids_wb") %>%
    # query data
    dplyr::filter(wb_debtor_country_name %in% debtor) %>%
    dplyr::filter(wb_creditor_name %in% creditor) %>%
    dplyr::filter(api_code %in% series) %>%
    dplyr::collect() %>%
    tidyr::pivot_longer(names_to = "year", values_to = "debt", cols = -dplyr::all_of(columns_ignore)) %>%
    dplyr::mutate(data_last_updated = lubridate::as_datetime(as.numeric(data_last_updated)),
                  year = as.numeric(year))
  # return a tibble
  return(data)
}
