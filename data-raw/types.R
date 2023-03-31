#
#   Event types
#


types <- data.frame(
  event_type = c("agree", "consult", "support", "concede", "cooperate", "aid",
                 "retreat", "request", "accuse", "reject", "threaten",
                 "protest", "sanction", "mobilize", "coerce", "assault"),
  requires_recipient = as.integer(c(0, 0, 0, 0, 1, 1,
                                  0, 0, 0, 0, 0,
                                  0, 1, 0, 0, 0))
  )

use_data(types, overwrite = TRUE)
