# honestamente no se para que sirve pero igual lo hago xD
inei_rule <- function(x,y, ...) {
  if (x < 10) {
    sprintf('%04d',999)
  } else {
    substr(y,7,11)
  }
}

pairwise_distance <- function(x) {
  condition <- spatial_db2 %>% 
    st_distance(spatial_db1[x,]) %>% 
    which.min()
  return(condition)
}


grouping_human_settlements <- function(spatial_db1, spatial_db2) {
  conditions <- vapply(X = seq_len(nrow(spatial_db1)),
                       FUN =  pairwise_distance,
                       FUN.VALUE =  1)
  spatial_db2$IDCCPP[conditions]
}


