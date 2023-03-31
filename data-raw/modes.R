#
#   Event modes
#

library(tibble)
library(tidyr)

modes <- tribble(
  ~event_type, ~mode,
  "consult", c("visit", "third-party", "multilateral", "phone"),
  "retreat", c("withdraw", "release", "return", "disarm", "ceasefire", "access",
               "resign"),
  "request", c("assist", "change", "yield", "meet"),
  "accuse", c("disapprove", "investigate", "allege"),
  "reject", c("assist", "change", "yield", "meet"),
  "threaten", c("restrict", "ban", "arrest", "relations", "expel", "territory",
                "violence"),
  "protest", c("demo", "riot", "strike", "hunger", "boycott", "obstruct"),
  "sanction", c("convict", "expel", "withdraw", "discontinue"),
  "mobilize", c("troops", "weapons", "police", "militia"),
  "coerce", c("seize", "restrict", "ban", "censor", "curfew", "martial-law",
              "arrest", "deport", "withhold", "misinformation", "cyber"),
  "assault", c("abduct", "beat", "torture", "execute", "sexual", "assassinate",
               "destroy", "primitive", "firearms", "explosives", "suicide-attack",
               "aerial", "drone", "heavy-weapons", "crowd-control", "cleansing",
               "massacre", "unconventional", "sideAB")
)


modes <- tidyr::unnest(modes, mode)
modes <- as.data.frame(modes)

use_data(modes, overwrite = TRUE)
