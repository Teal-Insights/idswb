
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
#> Loading required package: etl
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

## creating an etl object

``` r
# ceating an object
idswb_ob <-etl("idswb", dir = getwd())
#> No database was specified so I created one for you at:
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/file2dfe7b504d46.sqlite3
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
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/file2dfe356a4f38.sqlite3

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
get_debt(debtor = "Kenya", by_year = 2022)
#>                                                         series             id
#> 1                              External Debt - PPG - Bilateral DT.DOD.BLAT.CD
#> 2                                  External Debt - PPG - Bonds DT.DOD.PBND.CD
#> 3                           External Debt - PPG - Multilateral DT.DOD.MLAT.CD
#> 4                External Debt - PPG - Other Private Creditors DT.DOD.PROP.CD
#> 5 External Debt - PPG - Private Banks & Financial Institutions DT.DOD.PCBK.CD
#> 6                                  External Debt - PPG - Total DT.DOD.DPPG.CD
#>   year debtor      China       World
#> 1 2022  Kenya 6685750503 10119631310
#> 2 2022  Kenya          0  7100000000
#> 3 2022  Kenya          0 16719778200
#> 4 2022  Kenya          0           0
#> 5 2022  Kenya          0  1097776462
#> 6 2022  Kenya 6685750503 35037185972
```
