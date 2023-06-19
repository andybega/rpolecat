


get_polecat_doi <- function() {
  "doi:10.7910/DVN/AJGVIT"
}


get_dataverse_file_list <- function(doi = get_polecat_doi(),
                                    server = dataverse_api_token(print = FALSE)$server) {

  resp <- dataverse::get_dataset(doi, server = server)
  file_list <- resp$files[, c("label", "version", "creationDate", "id")]
  # Extract the data year from the file labels
  # fortunately right now for both types of labels:
  # - ngecEvents.20230103111842.Release603.DV.txt
  # - ngecEventsDV-2022.txt.zip
  # the first four numbers are the year, so we can just use the same regex
  file_list$data_year <- regmatches(file_list$label, regexpr("[0-9]{4}", file_list$label))
  file_list$data_year <- as.integer(file_list$data_year)

  file_list
}

