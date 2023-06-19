
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpolecat

<!-- badges: start -->
<!-- badges: end -->

The goal of rpolecat is to make downloading and working with the
[POLECAT event data](https://dataverse.harvard.edu/dataverse/POLECAT)
easier.

The POLECAT data are provided via two repositories on dataverse:

- [POLECAT Weekly
  Data](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/AJGVIT),
  containing the actual data files.
- [POLECAT
  Documentation](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/LMFPIP)

## Installation

You can install the development version of rpolecat like so:

``` r
library(remotes)
install_github("basil-analytics/rpolecat")
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

To download the data:

``` r
# (not run)

# to donwload all data
download_polecat(local_dir = "foo/foo")

# to download only some years
download_polecat(local_dir = "foo/foo", years = c(2021:2023))
```

## Data license

The data license is [viewable on
dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/AJGVIT).
We copy it here for convenience:

> The POLECAT data are produced by the Program on Geostrategic Risk
> (formerly the Political Instability Task Force). The Program on
> Geostrategic Risk is funded by the Central Intelligence Agency. The
> views expressed are the authors’ alone and do not represent the views
> of the U.S. Government. We are unable to provide the story text from
> which events are extracted or the URLs due to licensing restrictions.
> For any data issues or bug reports please contact the dataset points
> of contact. THESE MATERIALS ARE SUBJECT TO COPYRIGHT PROTECTION AND
> MAY ONLY BE USED AND COPIED FOR RESEARCH AND EDUCATIONAL PURPOSES. THE
> MATERIALS MAY NOT BE USED OR COPIED FOR ANY COMMERCIAL PURPOSES. ©
> 2023 Leidos. All rights reserved. THE MATERIALS ARE PROVIDED ON AN
> AS-IS BASIS, WITH NO WARRANTIES OR GUARANTIES OF ANY KIND. THE OWNERS
> WILL NOT BE LIABLE FOR ANY DAMAGES ARISING FROM THEIR USE. USE OF THE
> MATERIALS IS ENTIRELY AT YOUR OWN RISK.
