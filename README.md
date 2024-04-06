
<!-- README.md is generated from README.Rmd. Please edit that file -->

# idswb

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
```

## Overview of available datasets in idswb package

- ids: main information on debt

``` r
ids %>% head() %>% kable()
```

| ids_short_name                                | api_code       | data_last_updated | series_full_name                                                                                                                                                                                                                           | wb_debtor_country_name | wb_debtor_country_id | wb_creditor_name   | wb_creditor_id | year | ids_value |
|:----------------------------------------------|:---------------|:------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------------------|:---------------------|:-------------------|:---------------|:-----|----------:|
| External Debt - PPG - Total                   | DT.DOD.DPPG.CD | 2024-02-29        | External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$) |Afghanistan |AFG |Asian Dev. Bank    |915 |1970 | NA| |External Debt - PPG - Multilateral |DT.DOD.MLAT.CD |2024-02-29 |PPG, multilateral (DOD, current US$) | Afghanistan            | AFG                  | Asian Dev. Bank    | 915            | 1970 |        NA |
| External Debt - PPG - Total                   | DT.DOD.DPPG.CD | 2024-02-29        | External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$) |Afghanistan |AFG |Bulgaria |72 |1970 | NA| |External Debt - PPG - Bilateral |DT.DOD.BLAT.CD |2024-02-29 |PPG, bilateral (DOD, current US$)                  | Afghanistan            | AFG                  | Bulgaria           | 72             | 1970 |        NA |
| External Debt - PPG - Other Private Creditors | DT.DOD.PROP.CD | 2024-02-29        | PPG, other private creditors (DOD, current US$) |Afghanistan |AFG |Croatia |62 |1970 | NA| |External Debt - PPG - Total |DT.DOD.DPPG.CD |2024-02-29 |External debt stocks, public and publicly guaranteed (PPG) (DOD, current US$)         | Afghanistan            | AFG                  | Croatia            | 62             | 1970 |        NA |

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

| ids_series_id     | ids_series_name                                                                                                                                                  |
|:------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| BM.GSR.TOTL.CD    | Imports of goods, services and primary income (current US$) | |BN.CAB.XOKA.CD |Current account balance (current US$)                                             |
| BX.GRT.EXTA.CD.DT | Grants, excluding technical cooperation (current US$) | |BX.GRT.TECH.CD.DT |Technical cooperation grants (current US$)                                           |
| BX.GSR.TOTL.CD    | Exports of goods, services and primary income (current US$) | |BX.KLT.DINV.CD.DT |Foreign direct investment, net inflows in reporting economy (DRS, current US$) |

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
idswb_ob <-etl("idswb", dir = getwd())
#> No database was specified so I created one for you at:
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/filede57a0d26b3.sqlite3
```

## Extract

The first step here is to acquire data

``` r
idswb_ob %>% etl_extract()
#> Extracting raw data...
```

## Transform

This data might require conversion from its original format into files
that are appropriate for SQL import, typically in CSV format.

``` r
idswb_ob %>% etl_transform()
#> Transforming raw data ...
```

## Load

Fill the SQL database with the processed data.

``` r
idswb_ob %>% etl_load()
#> Loading data to the database...
```

We can still perform the steps above at once

``` r
# ceating an object
idswb_ob <-etl("idswb", dir = getwd())
#> No database was specified so I created one for you at:
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/filede5c5db5e2.sqlite3

idswb_ob %>% 
  # extract
  etl_extract() %>% 
  # transform
  etl_transform() %>% 
  # load
  etl_load()
#> Extracting raw data...
#> Transforming raw data ...
#> Loading data to the database...
```

## Querying data

We can now query debt of a given country that it owes to both China and
the World as follows using `get_debt()` function

``` r
get_debt(debtor = "Kenya", by_year = 2022) %>% kable()
```

| series                                                       | id             | year | debtor |      China |       World |
|:-------------------------------------------------------------|:---------------|:-----|:-------|-----------:|------------:|
| External Debt - PPG - Bilateral                              | DT.DOD.BLAT.CD | 2022 | Kenya  | 6685750503 | 10119631310 |
| External Debt - PPG - Bonds                                  | DT.DOD.PBND.CD | 2022 | Kenya  |          0 |  7100000000 |
| External Debt - PPG - Multilateral                           | DT.DOD.MLAT.CD | 2022 | Kenya  |          0 | 16719778200 |
| External Debt - PPG - Other Private Creditors                | DT.DOD.PROP.CD | 2022 | Kenya  |          0 |           0 |
| External Debt - PPG - Private Banks & Financial Institutions | DT.DOD.PCBK.CD | 2022 | Kenya  |          0 |  1097776462 |
| External Debt - PPG - Total                                  | DT.DOD.DPPG.CD | 2022 | Kenya  | 6685750503 | 35037185972 |

``` r
get_debt(debtor = "Nigeria", by_year = 2022) %>% kable()
```

| series                                                       | id             | year | debtor  |      China |       World |
|:-------------------------------------------------------------|:---------------|:-----|:--------|-----------:|------------:|
| External Debt - PPG - Bilateral                              | DT.DOD.BLAT.CD | 2022 | Nigeria | 4291730985 |  5169011908 |
| External Debt - PPG - Bonds                                  | DT.DOD.PBND.CD | 2022 | Nigeria |          0 | 16364972000 |
| External Debt - PPG - Multilateral                           | DT.DOD.MLAT.CD | 2022 | Nigeria |          0 | 16992036718 |
| External Debt - PPG - Other Private Creditors                | DT.DOD.PROP.CD | 2022 | Nigeria |          0 |           0 |
| External Debt - PPG - Private Banks & Financial Institutions | DT.DOD.PCBK.CD | 2022 | Nigeria |          0 |  1477698613 |
| External Debt - PPG - Total                                  | DT.DOD.DPPG.CD | 2022 | Nigeria | 4291730985 | 40003719240 |
