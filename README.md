
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
# input specifications
series <- c("DT.DOD.BLAT.CD","DT.DOD.PBND.CD",'DT.DOD.MLAT.CD',"DT.DOD.PROP.CD","DT.DOD.PCBK.CD","DT.DOD.DPPG.CD")
debtor <- "Kenya"
creditor <- c("China","World")

# Querying data
ids_query_data(etl_object = idswb_ob, debtor = debtor, creditor = creditor, series = series) %>% 
  dplyr::filter(year == "2022") %>% 
  kable()
```

| api_code       | data_last_updated | series_full_name                                                                                                                                                                   | wb_debtor_country_name | wb_debtor_country_id | wb_creditor_name | wb_creditor_id | year |        debt |
|:---------------|:------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------|:---------------------|:-----------------|:---------------|-----:|------------:|
| DT.DOD.BLAT.CD | 2024-02-29        | PPG, bilateral (DOD, current US$)                                             |Kenya                  |KEN                  |China            |730            | 2022|  6685750503| 
                                      |DT.DOD.DPPG.CD |2024-02-29        |External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)                                                                   | Kenya                  | KEN                  | China            | 730            | 2022 |  6685750503 |
| DT.DOD.PROP.CD | 2024-02-29        | PPG, other private creditors (DOD, current US$)                               |Kenya                  |KEN                  |China            |730            | 2022|          NA| 
                                      |DT.DOD.MLAT.CD |2024-02-29        |PPG, multilateral (DOD, current US$)                                                                                                            | Kenya                  | KEN                  | World            | WLD            | 2022 | 16719778200 |
| DT.DOD.PCBK.CD | 2024-02-29        | PPG, commercial banks (DOD, current US$)                                      |Kenya                  |KEN                  |World            |WLD            | 2022|  1097776462| 
                                      |DT.DOD.DPPG.CD |2024-02-29        |External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)                                                                   | Kenya                  | KEN                  | World            | WLD            | 2022 | 35037185972 |
| DT.DOD.PBND.CD | 2024-02-29        | PPG, bonds (DOD, current US$)                                                 |Kenya                  |KEN                  |World            |WLD            | 2022|  7100000000| 
                                      |DT.DOD.PROP.CD |2024-02-29        |PPG, other private creditors (DOD, current US$)                                                                                                 | Kenya                  | KEN                  | World            | WLD            | 2022 |          NA |
| DT.DOD.BLAT.CD | 2024-02-29        | PPG, bilateral (DOD, current US\$)                                                                                                                                                 | Kenya                  | KEN                  | World            | WLD            | 2022 | 10119631310 |

`Query 2:`

``` r
# input specifications
series <- c("DT.DOD.BLAT.CD","DT.DOD.PBND.CD",'DT.DOD.MLAT.CD',"DT.DOD.PROP.CD","DT.DOD.PCBK.CD","DT.DOD.DPPG.CD")
debtor <- "Nigeria"
creditor <- c("China","World")

# Querying data
ids_query_data(etl_object = idswb_ob, debtor = debtor, creditor = creditor, series = series) %>% 
  dplyr::filter(year == "2022") %>% 
  kable()
```

| api_code       | data_last_updated | series_full_name                                                                                                                                                                   | wb_debtor_country_name | wb_debtor_country_id | wb_creditor_name | wb_creditor_id | year |        debt |
|:---------------|:------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------|:---------------------|:-----------------|:---------------|-----:|------------:|
| DT.DOD.BLAT.CD | 2024-02-29        | PPG, bilateral (DOD, current US$)                                             |Nigeria                |NGA                  |China            |730            | 2022|  4291730985| 
                                      |DT.DOD.BLAT.CD |2024-02-29        |PPG, bilateral (DOD, current US$)                                                                                                               | Nigeria                | NGA                  | World            | WLD            | 2022 |  5169011908 |
| DT.DOD.DPPG.CD | 2024-02-29        | External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$) |Nigeria                |NGA                  |China            |730            | 2022|  4291730985| 
                                      |DT.DOD.DPPG.CD |2024-02-29        |External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)                                                                   | Nigeria                | NGA                  | World            | WLD            | 2022 | 40003719240 |
| DT.DOD.MLAT.CD | 2024-02-29        | PPG, multilateral (DOD, current US$)                                          |Nigeria                |NGA                  |World            |WLD            | 2022| 16992036718| 
                                      |DT.DOD.PBND.CD |2024-02-29        |PPG, bonds (DOD, current US$)                                                                                                                   | Nigeria                | NGA                  | World            | WLD            | 2022 | 16364972000 |
| DT.DOD.PCBK.CD | 2024-02-29        | PPG, commercial banks (DOD, current US$)                                      |Nigeria                |NGA                  |China            |730            | 2022|          NA| 
                                      |DT.DOD.PCBK.CD |2024-02-29        |PPG, commercial banks (DOD, current US$)                                                                                                        | Nigeria                | NGA                  | World            | WLD            | 2022 |  1477698613 |
| DT.DOD.PROP.CD | 2024-02-29        | PPG, other private creditors (DOD, current US\$)                                                                                                                                   | Nigeria                | NGA                  | World            | WLD            | 2022 |          NA |
