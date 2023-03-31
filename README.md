
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpolecat

<!-- badges: start -->
<!-- badges: end -->

The goal of rpolecat is to …

## Installation

You can install the development version of rpolecat like so:

``` r
library(remotes)
install_github("basil-analytics/rplover")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rpolecat)

data(contexts)
head(contexts)
#>                  context
#> 1               military
#> 2           intelligence
#> 3              executive
#> 4            legislative
#> 5               election
#> 6 political_institutions

data(modes)
head(modes)
#>   event_type         mode
#> 1    consult        visit
#> 2    consult  third-party
#> 3    consult multilateral
#> 4    consult        phone
#> 5    retreat     withdraw
#> 6    retreat      release
```
