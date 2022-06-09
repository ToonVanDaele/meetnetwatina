# init
library(tidyverse)
library(watina)


watina <- connect_watina()

df_mpt <- get_locs(watina) %>%
  collect %>%
  as.data.frame

head(df_mpt)

ggplot(df_mpt, aes(x = x, y = y)) + geom_point() + coord_equal()











dbDisconnect(watina)
