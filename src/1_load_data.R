# Load data

# Dit script maakt verbinding met Watina en laadt alle nodige data in.
# Het moet enkel worden gerund om een up-to-date data van de Watina
# databank in te lezen.

# Alle data wordt bewaard in dataframes als .Rds bestand in ./data/interim

# init
library(tidyverse)
library(DBI)
library(watina)

watina <- connect_watina()

# Meetpunt locaties

df_mpt <- get_locs(watina) %>%
  collect %>%
  as.data.frame

saveRDS(df_mpt, file = "./data/interim/df_mpt.RDS")


# Regio's

df_reg <- dbReadTable(watina, "vwDimGebied")

saveRDS(df_reg, file = "./data/interim/df_reg.RDS")

dbDisconnect(watina)
