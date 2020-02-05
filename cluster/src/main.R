# Librerias ---------------------------------------------------------------
library(tidyverse)
library(sf)
source("src/functions.R")


# data --------------------------------------------------------------------
spatial_db <- st_read(
  dsn = "data/base.gdb",
  layer = "CCPP_AER_HOG",
  stringsAsFactors = FALSE
)
# Seleccionamos solo el data_frame
db <- spatial_db %>%
  st_set_geometry(NULL) %>%
  as_tibble()

# El code que creaste (le puse 0999 para respetar
# cuatro espacios).
db %>%
  select("n_hogar", "IDCCPP") %>%
  rename(x = "n_hogar", y = "IDCCPP") %>%
  pmap_chr(inei_rule) -> spatial_db$group

# Asentamientos humanos a agrupar
spatial_db1 <- spatial_db %>%
  filter(group == "0999")
# Asentamientos humanos grandes
spatial_db2 <- spatial_db %>%
  filter(group != "0999")

spatial_db1$new_IDCCPP <- grouping_human_settlements(
  spatial_db1,
  spatial_db2
)
spatial_db2$new_IDCCPP <- spatial_db2$IDCCPP

#Juntamos nuestra base de datos denuevo
final_spatial_db <- rbind(spatial_db1, spatial_db2)

write_csv(final_spatial_db,
          'DONDE_QUIERAS_GUARDARLO')

nrow(spatial_db)
length(unique(spatial_db$IDCCPP))
length(unique(final_spatial_db$new_IDCCPP))
