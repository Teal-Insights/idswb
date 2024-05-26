
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
unique_counterpart_area %>% head() %>% gt::gt()
```

<div id="iqeqrflodv" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#iqeqrflodv table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#iqeqrflodv thead, #iqeqrflodv tbody, #iqeqrflodv tfoot, #iqeqrflodv tr, #iqeqrflodv td, #iqeqrflodv th {
  border-style: none;
}
&#10;#iqeqrflodv p {
  margin: 0;
  padding: 0;
}
&#10;#iqeqrflodv .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#iqeqrflodv .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#iqeqrflodv .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#iqeqrflodv .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#iqeqrflodv .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#iqeqrflodv .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#iqeqrflodv .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#iqeqrflodv .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#iqeqrflodv .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#iqeqrflodv .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#iqeqrflodv .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#iqeqrflodv .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#iqeqrflodv .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#iqeqrflodv .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#iqeqrflodv .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iqeqrflodv .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#iqeqrflodv .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#iqeqrflodv .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#iqeqrflodv .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iqeqrflodv .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#iqeqrflodv .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iqeqrflodv .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#iqeqrflodv .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iqeqrflodv .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#iqeqrflodv .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#iqeqrflodv .gt_left {
  text-align: left;
}
&#10;#iqeqrflodv .gt_center {
  text-align: center;
}
&#10;#iqeqrflodv .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#iqeqrflodv .gt_font_normal {
  font-weight: normal;
}
&#10;#iqeqrflodv .gt_font_bold {
  font-weight: bold;
}
&#10;#iqeqrflodv .gt_font_italic {
  font-style: italic;
}
&#10;#iqeqrflodv .gt_super {
  font-size: 65%;
}
&#10;#iqeqrflodv .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#iqeqrflodv .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#iqeqrflodv .gt_indent_1 {
  text-indent: 5px;
}
&#10;#iqeqrflodv .gt_indent_2 {
  text-indent: 10px;
}
&#10;#iqeqrflodv .gt_indent_3 {
  text-indent: 15px;
}
&#10;#iqeqrflodv .gt_indent_4 {
  text-indent: 20px;
}
&#10;#iqeqrflodv .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="ids_counterpart_area_id">ids_counterpart_area_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ids_counterpart_area_name">ids_counterpart_area_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="iso3c">iso3c</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="ids_counterpart_area_id" class="gt_row gt_right">1</td>
<td headers="ids_counterpart_area_name" class="gt_row gt_left">Austria</td>
<td headers="iso3c" class="gt_row gt_left">AUT</td></tr>
    <tr><td headers="ids_counterpart_area_id" class="gt_row gt_right">10</td>
<td headers="ids_counterpart_area_name" class="gt_row gt_left">Sweden</td>
<td headers="iso3c" class="gt_row gt_left">SWE</td></tr>
    <tr><td headers="ids_counterpart_area_id" class="gt_row gt_right">11</td>
<td headers="ids_counterpart_area_name" class="gt_row gt_left">Switzerland</td>
<td headers="iso3c" class="gt_row gt_left">CHE</td></tr>
    <tr><td headers="ids_counterpart_area_id" class="gt_row gt_right">12</td>
<td headers="ids_counterpart_area_name" class="gt_row gt_left">United Kingdom</td>
<td headers="iso3c" class="gt_row gt_left">GBR</td></tr>
    <tr><td headers="ids_counterpart_area_id" class="gt_row gt_right">130</td>
<td headers="ids_counterpart_area_name" class="gt_row gt_left">Algeria</td>
<td headers="iso3c" class="gt_row gt_left">DZA</td></tr>
    <tr><td headers="ids_counterpart_area_id" class="gt_row gt_right">133</td>
<td headers="ids_counterpart_area_name" class="gt_row gt_left">Libya</td>
<td headers="iso3c" class="gt_row gt_left">LBY</td></tr>
  </tbody>
  &#10;  
</table>
</div>

- unique_country: information on debtors

``` r
unique_country %>% head() %>% knitr::kable()
```

| ids_country_id | ids_country_name | iso3c |
|:---------------|:-----------------|:------|
| AFG            | Afghanistan      | AFG   |
| ALB            | Albania          | ALB   |
| DZA            | Algeria          | DZA   |
| AGO            | Angola           | AGO   |
| ARG            | Argentina        | ARG   |
| ARM            | Armenia          | ARM   |

- unique_series: information on series

``` r
unique_series %>% head() %>% gt::gt()
```

<div id="mbiwseqinu" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#mbiwseqinu table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#mbiwseqinu thead, #mbiwseqinu tbody, #mbiwseqinu tfoot, #mbiwseqinu tr, #mbiwseqinu td, #mbiwseqinu th {
  border-style: none;
}
&#10;#mbiwseqinu p {
  margin: 0;
  padding: 0;
}
&#10;#mbiwseqinu .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#mbiwseqinu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#mbiwseqinu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#mbiwseqinu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#mbiwseqinu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#mbiwseqinu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#mbiwseqinu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#mbiwseqinu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#mbiwseqinu .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#mbiwseqinu .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#mbiwseqinu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#mbiwseqinu .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#mbiwseqinu .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#mbiwseqinu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#mbiwseqinu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mbiwseqinu .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#mbiwseqinu .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#mbiwseqinu .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#mbiwseqinu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mbiwseqinu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#mbiwseqinu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mbiwseqinu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#mbiwseqinu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mbiwseqinu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#mbiwseqinu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mbiwseqinu .gt_left {
  text-align: left;
}
&#10;#mbiwseqinu .gt_center {
  text-align: center;
}
&#10;#mbiwseqinu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#mbiwseqinu .gt_font_normal {
  font-weight: normal;
}
&#10;#mbiwseqinu .gt_font_bold {
  font-weight: bold;
}
&#10;#mbiwseqinu .gt_font_italic {
  font-style: italic;
}
&#10;#mbiwseqinu .gt_super {
  font-size: 65%;
}
&#10;#mbiwseqinu .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#mbiwseqinu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#mbiwseqinu .gt_indent_1 {
  text-indent: 5px;
}
&#10;#mbiwseqinu .gt_indent_2 {
  text-indent: 10px;
}
&#10;#mbiwseqinu .gt_indent_3 {
  text-indent: 15px;
}
&#10;#mbiwseqinu .gt_indent_4 {
  text-indent: 20px;
}
&#10;#mbiwseqinu .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ids_series_id">ids_series_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="ids_series_name">ids_series_name</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="ids_series_id" class="gt_row gt_left">BM.GSR.TOTL.CD</td>
<td headers="ids_series_name" class="gt_row gt_left">Imports of goods, services and primary income (current US$)</td></tr>
    <tr><td headers="ids_series_id" class="gt_row gt_left">BN.CAB.XOKA.CD</td>
<td headers="ids_series_name" class="gt_row gt_left">Current account balance (current US$)</td></tr>
    <tr><td headers="ids_series_id" class="gt_row gt_left">BX.GRT.EXTA.CD.DT</td>
<td headers="ids_series_name" class="gt_row gt_left">Grants, excluding technical cooperation (current US$)</td></tr>
    <tr><td headers="ids_series_id" class="gt_row gt_left">BX.GRT.TECH.CD.DT</td>
<td headers="ids_series_name" class="gt_row gt_left">Technical cooperation grants (current US$)</td></tr>
    <tr><td headers="ids_series_id" class="gt_row gt_left">BX.GSR.TOTL.CD</td>
<td headers="ids_series_name" class="gt_row gt_left">Exports of goods, services and primary income (current US$)</td></tr>
    <tr><td headers="ids_series_id" class="gt_row gt_left">BX.KLT.DINV.CD.DT</td>
<td headers="ids_series_name" class="gt_row gt_left">Foreign direct investment, net inflows in reporting economy (DRS, current US$)</td></tr>
  </tbody>
  &#10;  
</table>
</div>

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
