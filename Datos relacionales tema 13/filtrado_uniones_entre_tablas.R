
#semi_join(x, y) solo ofrece todas las observaciones en x 
#que tienen una coincidencia en y. De las y nada

#anti_join(x, y) elimina todas las observaciones x 
#que tienen una coincidencia en y.Y saca las que no lo tienen

#numero de destinos que tiene cada aeropuerto
top_dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(10)
top_dest

#Cada vuelo que fue a uno de los destinos anteriores
flights %>% 
  filter(dest %in% top_dest$dest)

#Los vuelos ue tienen coincidencia con top_dest
flights %>% 
  semi_join(top_dest)

#¿Aviones que no han volado?
flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(tailnum, sort = TRUE)

airports %>% count(alt, lon) %>% filter(n == 1)