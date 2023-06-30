
#' Download POLECAT
#'
#' Download the POLECAT data from dataverse.
#'
#' @param local_dir Which local directory to download the data to?
#' @param years Do you want to download data for only specific years? The
#'   default (NULL) will download all available data. Otherwise, specify a
#'   numeric vector, e.g. \code{2023}, \code{2022:2023}, or \code{c(2021, 2023)}.
#' @param skip_existing Skip files that are already in "local_dir"?
#' @param verbose Print progress messages as files are being downloaded?
#' @param dryrun Don't actually download the files, just print information on
#'   what files would be downloaded.
#'
#' @details This function will download files from dataverse as they are, which
#'   namely means that the zipped files will remain zipped. Two potential issues:
#'
#'   - You zipped the "ReleaseXXX.DV.txt" files to save space: "skip_existing"
#'     should be able to handle that. It will remove ".zip" or ".gz" from the
#'     filenames before comparing.
#'   - You unzipped the yearly data files, which actually each contain 12
#'     monthly data files. To avoid re-downloading those, use "skip_existing"
#'     and set the "years" argument to only the current year. See the examples.
#'
#' @returns Data will be downloaded to \code{local_dir}.
#'
#' @examples
#' \dontrun{
#'   # Basic, fresh download
#'   download_polecat("my/data/dir")
#'
#'   # Next time, to avoid re-downloading files you already have:
#'   download_polecat("my/data/dir", skip_existing = TRUE)
#'
#'   # To download only fresh data fur the current year, or avoid re-downloading
#'   # the yearly historical data files if you unzipped them:
#'   download_polecat("my/data/dir", years = 2023, skip_existing = TRUE)
#' }
#' @export
#' @md
download_polecat <- function(local_dir, years = NULL, skip_existing = TRUE,
                             verbose = TRUE, dryrun = FALSE) {
  # Check arguments
  stopifnot(
    "'skip_existing' must be logical" = is.logical(skip_existing),
    "'verbose' must be logical" = is.logical(verbose),
    "'dryrun' must be logical" = is.logical(dryrun)
  )
  if (!dir.exists(local_dir)) {
    msg <- sprintf("Directory '%s' does not exist, create it first with `dir.create(%s)`",
                   local_dir, local_dir)
    stop(msg)
  }

  dataverse_files <- get_dataverse_file_list()

  if (!is.null(years)) {
    years <- as.integer(years)
    dataverse_files <- dataverse_files[dataverse_files$data_year %in% years, ]
  }

  # Do we need to check for an exclude already present local files?
  skip_n <- NA_integer_  # initialize in case we do a dry run and need it for message
  if (skip_existing) {
    local_files <- dir(local_dir)

    # remove any .zip or .gz extensions in case the files are locally zipped
    local_files <- gsub("\\.zip$|\\.gz$", "", local_files)

    already_present <- dataverse_files$label %in% local_files
    if (any(already_present)) {
      skip_n <- sum(already_present)
      dataverse_files <- dataverse_files[!already_present, ]

      # don't print this if dryrun because we'll print it below
      if (verbose & !dryrun) {
        cat(sprintf("Skipping download for %s files that are already present\n",
                    skip_n))
      }
    }
  }

  # Early exit if this is a dryrun
  if (dryrun) {
    cat("Dryrun\n")
    cat(sprintf("Local dir is '%s'\n", local_dir))
    if (!is.na(skip_n)) {
      cat(sprintf("Skipping download for %s files that are already present\n",
                  skip_n))
    }
    cat(paste0(
      sprintf("Downloading %s files:\n", nrow(dataverse_files)),
      paste0(dataverse_files$label, collapse = "\n")
    ))
    return(invisible(TRUE))
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


