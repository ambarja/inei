# Insumos:
library(tidyverse)  # pkg para ciencia de datos
library(sf)         # pkg para manejar datos vectoriales
library(sp)         # spatial 
library(geosphere)  # matriz de distancias spatial :V

# Lecutura de un geodatabase
pts <- st_read(dsn = 'Data/base.gdb',layer = 'CCPP_AER_HOG')
# Contar puntos 
# pol$n_points <- lengths(st_intersects(pol, pts))

# Creación de un nuevo campo, con la finalidad de poner 999 a los 
# centros poblados menores a 10 hogares, caso contrario solo mantener
# el codigo de la posición 7 a 11 de IDCCPP.

pts$group <- ''
for(i in 1:nrow(pts)){
  
  if(pts[["n_hogar"]][i] < 10 ){
  
    pts[['group']][i] <- '999'
    
  }else{
    pts[['group']][i] <- substr(pts$IDCCPP[i],start = 7,stop = 11)
  }
}

# Visualizando los primeras filas:
head(pts)

# Problema:
# Todos los centros poblados con un numero de hogares menores a 10, agruparse 
# con los centros poblados cercanos y cuya suma este por encima de 10.

# Observación: Este agrupamiento tiene cómo límite  a un codigo único IDAER


# Barja: Con la función "distm" obtengo una matriz de distancia,pero ahora se
# me complica como indenticar el mínimo y agrupar espacialmente y cuya 
# condición sea mayor a 10 hogares :c 



new2 <- list()
for(i in 1:nrow(pts)){
  new <- pts %>% 
  filter(IDAER ==  pts[['IDAER']][i]) %>% as('Spatial')
  new$dist <- distm(new)
  new <- new[order(new$n_hogar),]
  new2[[i]] <- new@data
  
}

# vista <- st_as_sf(vista)
# write_sf(vista,'nn.shp')






if(new2[[110]][7] < 10){
  suma <- 
  
  
}

new[[2]]





# 
# new <- pts %>% 
#   filter(IDAER == 200101002003 ) %>% as('Spatial')
# 
# new <- new[order(new$n_hogar),]
# new$dist <- distm(new)
# new$dist
# 
# mm <- distm(new)
# 
# 
# 
# diag(mdist) <- NA
# new$dist <- mdist[,1]
# if(pts[["n_hogar"]][i] < 10 & )
# 
#     
#  
#   mdist[1,]
#   
#   mdist <= 0
#   x <- matrix(c(1, 2, 0, 4), nrow = 2, ncol = 2)
#   
#   
#   
#   which.min(mdist[,])
#   



# IDAER + IDCCPP[to = 7,11]
# 
# pts$IDCCPP[1]
# substr(pts$IDCCPP[1],start = 7,stop = 11)
mm = pts %>% as_tibble()
write.csv(mm,'mm2.csv')

substr(pts$IDCCPP[7],start = 7,stop = 11)

  
  
  
  
  
  


