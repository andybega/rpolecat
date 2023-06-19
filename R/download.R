
#' Download POLECAT
#'
#' Download the POLECAT data from dataverse.
#'
#' @param local_dir Which local directory to download the data to?
#' @param years Do you want to download data for only specific years? The
#'   default (NULL) will download all available data. Otherwise, specify a
#'   numeric vector, e.g. \code{2023}, \code{2022:2023}, or \code{c(2021, 2023)}.
#' @param verbose Print progress messages as files are being downloaded?
#'
#' @returns Data will be downloaded to \code{local_dir}.
#'
#' @export
download_polecat <- function(local_dir, years = NULL, verbose = TRUE) {
  dataverse_files <- get_dataverse_file_list()

  if (!is.null(years)) {
    years <- as.integer(years)
    dataverse_files <- dataverse_files[dataverse_files$year %in% years]
  }

  for (i in seq_len(nrow(dataverse_files))) {
    file_name <- dataverse_files$label[[i]]
    file_path <- file.path(local_dir, file_name)
    if (verbose) cat(paste0("Downloading '", file_name, "'\n"))
    f <- dataverse::get_file(dataverse_files$id[[i]],
                             dataset = get_polecat_doi(),
                             format = NULL)
    writeBin(f, file_path)
  }

  invisible(TRUE)
}


