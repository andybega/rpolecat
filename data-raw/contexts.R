#
#   Contexts
#

contexts <- data.frame(
  context = c(
    "military", "intelligence", "executive", "legislative", "election",
    "political_institutions", "pro-democracy", "pro-autocracy", "economic",
    "legal", "reparations", "human_rights", "rights_freedoms", "repression",
    "human_security", "gender", "lgbt", "religion_ethnicity", "inequality",
    "diplomatic", "territory", "peacekeeping", "health", "asylum", "migration",
    "disasters", "natural_resources", "environment", "technology", "terrorism",
    "cbrn", "cyber", "misinformation", "crime", "corruption", "illegal_drugs",
    "trafficking")
)

usethis::use_data(contexts, overwrite = TRUE)
