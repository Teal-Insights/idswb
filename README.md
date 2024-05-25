
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
unique_counterpart_area %>% head() %>% kable()
```

| ids_counterpart_area_id | ids_counterpart_area_name |
|:------------------------|:--------------------------|
| 1                       | Austria                   |
| 10                      | Sweden                    |
| 11                      | Switzerland               |
| 12                      | United Kingdom            |
| 130                     | Algeria                   |
| 133                     | Libya                     |

- unique_country: information on debtors

``` r
unique_country %>% head() %>% kable()
```

| ids_country_id | ids_country_name |
|:---------------|:-----------------|
| AFG            | Afghanistan      |
| ALB            | Albania          |
| DZA            | Algeria          |
| AGO            | Angola           |
| ARG            | Argentina        |
| ARM            | Armenia          |

- unique_series: information on series

``` r
unique_series %>% head() %>% kable()
```

| ids_series_id     | ids_series_name                                                                                    |
|:------------------|:---------------------------------------------------------------------------------------------------|
| BM.GSR.TOTL.CD    | Imports of goods, services and primary income (current US$)                    |                   
                     |BN.CAB.XOKA.CD    |Current account balance (current US$)                                           |
| BX.GRT.EXTA.CD.DT | Grants, excluding technical cooperation (current US$)                          |                   
                     |BX.GRT.TECH.CD.DT |Technical cooperation grants (current US$)                                      |
| BX.GSR.TOTL.CD    | Exports of goods, services and primary income (current US$)                    |                   
                     |BX.KLT.DINV.CD.DT |Foreign direct investment, net inflows in reporting economy (DRS, current US$)  |

- unique_time: information on years

``` r
unique_time %>% head() %>% kable()
```

| ids_time_id | ids_time_name |
|:------------|--------------:|
| YR1970      |          1970 |
| YR1971      |          1971 |
| YR1972      |          1972 |
| YR1973      |          1973 |
| YR1974      |          1974 |
| YR1975      |          1975 |

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
# inputs specificatio
series <- c("DT.DOD.BLAT.CD","DT.DOD.PBND.CD",'DT.DOD.MLAT.CD',"DT.DOD.PROP.CD","DT.DOD.PCBK.CD","DT.DOD.DPPG.CD")
debtor <- "Kenya"
creditor <- c("China","World")

# Querying data
ids_query_data(etl_object = idswb_ob, debtor = debtor, creditor = creditor, series = series) %>% 
  dplyr::filter(year == "2022") 
#> # A tibble: 9 × 9
#>   api_code       data_last_updated   series_full_name     wb_debtor_country_name
#>   <chr>          <dttm>              <chr>                <chr>                 
#> 1 DT.DOD.BLAT.CD 2024-02-29 00:00:00 PPG, bilateral (DOD… Kenya                 
#> 2 DT.DOD.DPPG.CD 2024-02-29 00:00:00 External debt stock… Kenya                 
#> 3 DT.DOD.PROP.CD 2024-02-29 00:00:00 PPG, other private … Kenya                 
#> 4 DT.DOD.MLAT.CD 2024-02-29 00:00:00 PPG, multilateral (… Kenya                 
#> 5 DT.DOD.PCBK.CD 2024-02-29 00:00:00 PPG, commercial ban… Kenya                 
#> 6 DT.DOD.DPPG.CD 2024-02-29 00:00:00 External debt stock… Kenya                 
#> 7 DT.DOD.PBND.CD 2024-02-29 00:00:00 PPG, bonds (DOD, cu… Kenya                 
#> 8 DT.DOD.PROP.CD 2024-02-29 00:00:00 PPG, other private … Kenya                 
#> 9 DT.DOD.BLAT.CD 2024-02-29 00:00:00 PPG, bilateral (DOD… Kenya                 
#> # ℹ 5 more variables: wb_debtor_country_id <chr>, wb_creditor_name <chr>,
#> #   wb_creditor_id <chr>, year <dbl>, debt <dbl>
```

`Query 2:`

``` r
# inputs specificatio
series <- c("DT.DOD.BLAT.CD","DT.DOD.PBND.CD",'DT.DOD.MLAT.CD',"DT.DOD.PROP.CD","DT.DOD.PCBK.CD","DT.DOD.DPPG.CD")
debtor <- "Nigeria"
creditor <- c("China","World")

# Querying data
ids_query_data(etl_object = idswb_ob, debtor = debtor, creditor = creditor, series = series) %>% 
  dplyr::filter(year == "2022") 
#> # A tibble: 9 × 9
#>   api_code       data_last_updated   series_full_name     wb_debtor_country_name
#>   <chr>          <dttm>              <chr>                <chr>                 
#> 1 DT.DOD.BLAT.CD 2024-02-29 00:00:00 PPG, bilateral (DOD… Nigeria               
#> 2 DT.DOD.BLAT.CD 2024-02-29 00:00:00 PPG, bilateral (DOD… Nigeria               
#> 3 DT.DOD.DPPG.CD 2024-02-29 00:00:00 External debt stock… Nigeria               
#> 4 DT.DOD.DPPG.CD 2024-02-29 00:00:00 External debt stock… Nigeria               
#> 5 DT.DOD.MLAT.CD 2024-02-29 00:00:00 PPG, multilateral (… Nigeria               
#> 6 DT.DOD.PBND.CD 2024-02-29 00:00:00 PPG, bonds (DOD, cu… Nigeria               
#> 7 DT.DOD.PCBK.CD 2024-02-29 00:00:00 PPG, commercial ban… Nigeria               
#> 8 DT.DOD.PCBK.CD 2024-02-29 00:00:00 PPG, commercial ban… Nigeria               
#> 9 DT.DOD.PROP.CD 2024-02-29 00:00:00 PPG, other private … Nigeria               
#> # ℹ 5 more variables: wb_debtor_country_id <chr>, wb_creditor_name <chr>,
#> #   wb_creditor_id <chr>, year <dbl>, debt <dbl>
```
