# init
library(tidyverse)
library(watina)


watina <- connect_watina()

df_mpt <- get_locs(watina) %>%
  collect %>%
  as.data.frame


saveRDS(df_mpt, file = "./data/interim/df_mpt.RDS")









dbDisconnect(watina)
