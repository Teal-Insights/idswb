
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
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/file6a5467ab6e3e.sqlite3
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
#> /Users/reubenopondo/Data Science/projects/clients/teal-insights/p5-idswb/idswb/file6a545a616006.sqlite3

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
