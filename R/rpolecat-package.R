#' Download and Transform the POLECAT Event Data
#'
#' @description Download the POLECAT data from Dataverse.
#'
#' @docType package
#' @aliases rpolecat
"_PACKAGE"

.onAttach <- function(...) {
  # Make sure the Dataverse API token and server are set
  if (!check_api_token()) {
    msg <- strwrap("WARNING: could not find Harvard Dataverse server and API token. This is required for download functionality. See ?dataverse_api_token")
    msg <- paste0(msg, collapse = "\n")
    if (interactive()) {
      packageStartupMessage(msg)
    }
  }
}

## usethis namespace: start
## usethis namespace: end
NULL
