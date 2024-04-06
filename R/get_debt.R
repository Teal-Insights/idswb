
#' Gets debt information for a given country that it owes to both China and the World
#'
#' This function extract a tibble showing how a debtor owes to both China and the World
#'
#' @param debtor Country of interest
#' @param by_year Year of interest
#'
#' @return Returns a tibble showing how debtor owes to both China and the World
#' @export
#'
get_debt <- function(debtor,by_year = 2022){
  df_debt <- idswb::ids %>%
    # mutate(year = as.integer(year)) %>%
    dplyr::filter(wb_debtor_country_name == debtor, wb_creditor_name %in% c("China", "World"), year %in% by_year) %>%
    dplyr::select(
      series = ids_short_name,
      id = api_code,
      year = year,
      debtor = wb_debtor_country_name,
      creditor = wb_creditor_name,
      debt = ids_value) %>%
    dplyr::mutate(debt = ifelse(test = (is.na(debt)), yes = 0, no = debt)) %>%
    tidyr::spread(key = creditor, value = debt, fill = 0)
  # return results
  return(df_debt)
}
