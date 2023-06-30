
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rpolecat

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/rpolecat)](https://CRAN.R-project.org/package=rpolecat)
<!-- badges: end -->

rpolecat makes downloading and working with the [POLECAT event
data](https://dataverse.harvard.edu/dataverse/POLECAT) easier.

The main download functionality works, but there’s more stuff in the
works, see our roadmap in
<https://github.com/basil-analytics/rpolecat/issues/1>.

The POLECAT data are provided via two repositories on dataverse:

- [POLECAT Weekly
  Data](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/AJGVIT),
  containing the actual data files.
- [POLECAT
  Documentation](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/LMFPIP)

The data are described in two papers:

- [PLOVER and POLECAT: A New Political Event Ontology and
  Dataset](https://osf.io/preprints/socarxiv/rm5dw/): data paper with
  details on the POLECAT data and PLOVER ontology.
- [Creating Custom Event Data Without Dictionaries: A Bag-of-Tricks
  (arXiv)](https://arxiv.org/abs/2304.01331): details on the NGEC coder
  that produces the data.

## Installation

You can install the development version of rpolecat like so:

``` r
library(remotes)
install_github("basil-analytics/rpolecat")
```

rpolecat depends on the [R Dataverse
Client](https://github.com/IQSS/dataverse-client-r) to interact with the
Dataverse API. That package requires two environment variables in order
to be able to interact with the API. More details are documented in the
dataverse R package readme [API Access
Keys](https://github.com/IQSS/dataverse-client-r#api-access-keys)
section.

One way to meet this requirement without have to mess with R every time
you start it is to:

1.  [Obtain an API access
    token](https://guides.dataverse.org/en/latest/user/account.html#api-token)
    from Harvard Dataverse.

2.  Add the following lines to your
    [`.Rprofile`](https://support.posit.co/hc/en-us/articles/360047157094-Managing-R-with-Rprofile-Renviron-Rprofile-site-Renviron-site-rsession-conf-and-repos-conf)
    file:

    ``` r
    # dataverse API token  
    Sys.setenv(DATAVERSE_SERVER = "dataverse.harvard.edu")  
    Sys.setenv(DATAVERSE_KEY = "<your API token>")  
    ```

    (You can find and open your `.Rprofile` file using
    `usethis::edit_r_profile()` if the
    [usethis](https://cran.r-project.org/package=usethis) package is
    installed.)  

3.  Restart R for the changes to take effect.

## Example

One of the main functions of this package is to download the POLECAT
data without manual point and clicking on Dataverse:

``` r
# (not run)

# one-stop-shop for getting all data and keeping updated with new data:
# 1st time
download_polecat(local_dir = "my/data/dir", skip_exiting = TRUE)
# next times
download_polecat(local_dir = "my/data/dir", years = 2023, skip_existing = TRUE)

# see ?download_polecat
```

This will download the files as they are, namely the current year weekly
files will remain unzipped, and the historical data yearly ZIP archives
will remain zipped. However, the “skip_existing” functionality *should*
be able to handle things correctly if you zip/unzip various files, see
`?download_polecat` for more details.

The package also include information from the [PLOVER
ontology](https://github.com/openeventdata/PLOVER/blob/master/PLOVER_MANUAL.pdf):

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
