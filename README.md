
<!-- README.md is generated from README.Rmd. Please edit that file -->

# idswb <a href="https://teal-insights.github.io/idswb/"><img src="man/figures/logo.png" align="right" height="139" alt="idswb website" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/Teal-Insights/idswb/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Teal-Insights/idswb/actions/workflows/R-CMD-check.yaml)
[![LifeCycle](https://img.shields.io/badge/lifecycle-experimental-orange)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Test
coverage](https://github.com/Teal-Insights/idswb/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/Teal-Insights/idswb/actions/workflows/test-coverage.yaml)
[![License:
CC0](https://img.shields.io/badge/License-CC0-lightgrey.svg)](https://choosealicense.com/licenses/cc0-1.0/)
[![Website](https://github.com/Teal-Insights/idswb/actions/workflows/pkgdown.yaml/badge.svg)](https://github.com/Teal-Insights/idswb/actions/workflows/pkgdown.yaml)
<!-- badges: end -->

`idswb` is primarily a data package enabling an efficient method for
working with [International Debt Statistics from World
Bank](https://www.worldbank.org/en/programs/debt-statistics/ids) in R.

## Installation

You can install the development version of idswb from
[GitHub](https://github.com/) with:

``` r
# setting options
options(timeout = 600, scipen = 999)

# install.packages("devtools")
devtools::install_github("Teal-Insights/idswb")
```

This package will likely never be published on
[CRAN](https://cran.r-project.org/) because the data file sizes are too
big.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(idswb)
library(knitr)
library(tidyverse)
```

## Overview of available datasets in idswb package

- unique_counterpart_area: information on counterparts (creditors)

``` r
unique_counterpart_area %>% head()
#> # A tibble: 6 × 3
#>   ids_counterpart_area_id ids_counterpart_area_name iso3c
#>   <chr>                   <chr>                     <chr>
#> 1 1                       Austria                   AUT  
#> 2 10                      Sweden                    SWE  
#> 3 11                      Switzerland               CHE  
#> 4 12                      United Kingdom            GBR  
#> 5 130                     Algeria                   DZA  
#> 6 133                     Libya                     LBY
```

- unique_country: information on debtors

``` r
unique_country %>% head()
#> # A tibble: 6 × 3
#>   ids_country_id ids_country_name iso3c
#>   <chr>          <chr>            <chr>
#> 1 AFG            Afghanistan      AFG  
#> 2 ALB            Albania          ALB  
#> 3 DZA            Algeria          DZA  
#> 4 AGO            Angola           AGO  
#> 5 ARG            Argentina        ARG  
#> 6 ARM            Armenia          ARM
```

- unique_series: information on series

``` r
unique_series %>% head()
#> # A tibble: 6 × 2
#>   ids_series_id     ids_series_name                                             
#>   <chr>             <chr>                                                       
#> 1 BM.GSR.TOTL.CD    Imports of goods, services and primary income (current US$) 
#> 2 BN.CAB.XOKA.CD    Current account balance (current US$)                       
#> 3 BX.GRT.EXTA.CD.DT Grants, excluding technical cooperation (current US$)       
#> 4 BX.GRT.TECH.CD.DT Technical cooperation grants (current US$)                  
#> 5 BX.GSR.TOTL.CD    Exports of goods, services and primary income (current US$) 
#> 6 BX.KLT.DINV.CD.DT Foreign direct investment, net inflows in reporting economy…
```

- unique_time: information on years

``` r
unique_time %>% head()
#> # A tibble: 6 × 2
#>   ids_time_id ids_time_name
#>   <chr>               <dbl>
#> 1 YR1970               1970
#> 2 YR1971               1971
#> 3 YR1972               1972
#> 4 YR1973               1973
#> 5 YR1974               1974
#> 6 YR1975               1975
```

## creating an etl object

We create an ETL object by specifying a string that defines the object’s
class, and use the package `idswb` to gain access to the relevant data.

``` r
# ceating an object
# idswb_ob <-etl("idswb", dir = getwd())
```

## Extract

The first step here is to acquire data

``` r
# idswb_ob %>% etl_extract()
```

## Transform

This data might require conversion from its original format into files
that are appropriate for SQL import, typically in CSV format.

``` r
# idswb_ob %>% etl_transform()
```

## Load

Fill the SQL database with the processed data.

``` r
# idswb_ob %>% etl_load()
```

We can still perform the steps above at once

``` r
# ceating an object
idswb_ob <-etl("idswb", dir = getwd())

idswb_ob %>% 
  # extract
  etl_extract() %>% 
  # transform
  etl_transform() %>% 
  # load
  etl_load()
```

## Using etl_create method

``` r
# idswb_ob %>% etl_create()
```

## Querying data

We can now query debt of a given country that it owes to both China and
the World as follows

`Query 1:`

``` r
# input specifications
series <- c("DT.DOD.BLAT.CD","DT.DOD.PBND.CD",'DT.DOD.MLAT.CD',"DT.DOD.PROP.CD","DT.DOD.PCBK.CD","DT.DOD.DPPG.CD")
debtor <- "Kenya"
creditor <- c("China","World")

# Querying data
ids_query_data(etl_object = idswb_ob, debtor = debtor, creditor = creditor, series = series) %>% 
  dplyr::filter(year == "2022") 
#>         api_code data_last_updated
#> 1 DT.DOD.BLAT.CD        2024-02-29
#> 2 DT.DOD.DPPG.CD        2024-02-29
#> 3 DT.DOD.PROP.CD        2024-02-29
#> 4 DT.DOD.MLAT.CD        2024-02-29
#> 5 DT.DOD.PCBK.CD        2024-02-29
#> 6 DT.DOD.DPPG.CD        2024-02-29
#> 7 DT.DOD.PBND.CD        2024-02-29
#> 8 DT.DOD.PROP.CD        2024-02-29
#> 9 DT.DOD.BLAT.CD        2024-02-29
#>                                                                series_full_name
#> 1                                             PPG, bilateral (DOD, current US$)
#> 2 External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)
#> 3                               PPG, other private creditors (DOD, current US$)
#> 4                                          PPG, multilateral (DOD, current US$)
#> 5                                      PPG, commercial banks (DOD, current US$)
#> 6 External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)
#> 7                                                 PPG, bonds (DOD, current US$)
#> 8                               PPG, other private creditors (DOD, current US$)
#> 9                                             PPG, bilateral (DOD, current US$)
#>   wb_debtor_country_name wb_debtor_country_id wb_creditor_name wb_creditor_id
#> 1                  Kenya                  KEN            China            730
#> 2                  Kenya                  KEN            China            730
#> 3                  Kenya                  KEN            China            730
#> 4                  Kenya                  KEN            World            WLD
#> 5                  Kenya                  KEN            World            WLD
#> 6                  Kenya                  KEN            World            WLD
#> 7                  Kenya                  KEN            World            WLD
#> 8                  Kenya                  KEN            World            WLD
#> 9                  Kenya                  KEN            World            WLD
#>   year        debt
#> 1 2022  6685750503
#> 2 2022  6685750503
#> 3 2022          NA
#> 4 2022 16719778200
#> 5 2022  1097776462
#> 6 2022 35037185972
#> 7 2022  7100000000
#> 8 2022          NA
#> 9 2022 10119631310
```

`Query 2:`

``` r
# input specifications
series <- c("DT.DOD.BLAT.CD","DT.DOD.PBND.CD",'DT.DOD.MLAT.CD',"DT.DOD.PROP.CD","DT.DOD.PCBK.CD","DT.DOD.DPPG.CD")
debtor <- "Nigeria"
creditor <- c("China","World")

# Querying data
ids_query_data(etl_object = idswb_ob, debtor = debtor, creditor = creditor, series = series) %>% 
  dplyr::filter(year == "2022")
#>         api_code data_last_updated
#> 1 DT.DOD.BLAT.CD        2024-02-29
#> 2 DT.DOD.BLAT.CD        2024-02-29
#> 3 DT.DOD.DPPG.CD        2024-02-29
#> 4 DT.DOD.DPPG.CD        2024-02-29
#> 5 DT.DOD.MLAT.CD        2024-02-29
#> 6 DT.DOD.PBND.CD        2024-02-29
#> 7 DT.DOD.PCBK.CD        2024-02-29
#> 8 DT.DOD.PCBK.CD        2024-02-29
#> 9 DT.DOD.PROP.CD        2024-02-29
#>                                                                series_full_name
#> 1                                             PPG, bilateral (DOD, current US$)
#> 2                                             PPG, bilateral (DOD, current US$)
#> 3 External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)
#> 4 External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)
#> 5                                          PPG, multilateral (DOD, current US$)
#> 6                                                 PPG, bonds (DOD, current US$)
#> 7                                      PPG, commercial banks (DOD, current US$)
#> 8                                      PPG, commercial banks (DOD, current US$)
#> 9                               PPG, other private creditors (DOD, current US$)
#>   wb_debtor_country_name wb_debtor_country_id wb_creditor_name wb_creditor_id
#> 1                Nigeria                  NGA            China            730
#> 2                Nigeria                  NGA            World            WLD
#> 3                Nigeria                  NGA            China            730
#> 4                Nigeria                  NGA            World            WLD
#> 5                Nigeria                  NGA            World            WLD
#> 6                Nigeria                  NGA            World            WLD
#> 7                Nigeria                  NGA            China            730
#> 8                Nigeria                  NGA            World            WLD
#> 9                Nigeria                  NGA            World            WLD
#>   year        debt
#> 1 2022  4291730985
#> 2 2022  5169011908
#> 3 2022  4291730985
#> 4 2022 40003719240
#> 5 2022 16992036718
#> 6 2022 16364972000
#> 7 2022          NA
#> 8 2022  1477698613
#> 9 2022          NA
```
