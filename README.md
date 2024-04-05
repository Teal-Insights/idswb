
<!-- README.md is generated from README.Rmd. Please edit that file -->

# idswb

<!-- badges: start -->
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

## creating an etl object

``` r
# ceating an object
idswb_ob <-etl("idswb", dir = getwd())
#> No database was specified so I created one for you at:
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/file2fd064ab5d04.sqlite3
```

## perform extract

``` r
idswb_ob %>% etl_extract()
#> Extracting raw data...
```

## perform transform

``` r
idswb_ob %>% etl_transform()
#> Transforming raw data ...
```

## perform load

``` r
idswb_ob %>% etl_load()
#> Loading data to the database...
```

We can still perform the steps above at once

``` r
# ceating an object
idswb_ob <-etl("idswb", dir = getwd())
#> No database was specified so I created one for you at:
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/file2fd0361b7909.sqlite3

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
