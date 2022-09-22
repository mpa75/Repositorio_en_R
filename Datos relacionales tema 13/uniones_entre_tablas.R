
#Uniones Mutantes


#Unión interna
flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2

#left_join()suma columnas 
#coge todo lo que falta en ailines y pegalo a lo que tiene fligts2
flights2 %>%
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")

(flights3 <- airlines %>% 
  select(carrier))

(flights2 %>%
  select(-origin, -dest) %>% 
  mutate(name = airlines$name[match(carrier, airlines$carrier)]))

#Ejemplo de relaciones x e y en dos tablas
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

#inner_join -> devuelve todas las filas coincidentes de la
#clave que comparten
x %>% 
  inner_join(y, by = "key")

#Unión externa

#>A left join keeps all observations in x.
#A right join keeps all observations in y.
#A full join keeps all observations in x and y.

#Si tiene un valor id x que no es correspondido con un valor
#en y, crea un valor nulo en y para representarlo en el resultado
#de la inión

##PUEDE HABER CLAVES DUPLICADAS
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)
left_join(x, y, by = "key")

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  3, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  2, "y3",
  3, "y4"
)
left_join(x, y, by = "key")

flights2 %>% 
  left_join(weather)

flights2 %>% 
  left_join(airports, c("dest" = "faa"))

airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat)) +
  borders("state") +
  geom_point() +
  coord_quickmap()


#OTRAS IMPLEMENTACIONES 

#Equivalencia entre ellas

#dplyr                  	join
#inner_join(x, y)	       merge(x, y)
#left_join(x, y)	       merge(x, y, all.x = TRUE)
#right_join(x, y)	       merge(x, y, all.y = TRUE),
#full_join(x, y)	       merge(x, y, all.x = TRUE, all.y = TRUE)

#dplyr	                           sql
#inner_join(x, y, by = "z")	     SELECT * FROM x INNER JOIN y USING (z)
#left_join(x, y, by = "z")	     SELECT * FROM x LEFT OUTER JOIN y USING (z)
#right_join(x, y, by = "z")	     SELECT * FROM x RIGHT OUTER JOIN y USING (z)
#full_join(x, y, by = "z")	     SELECT * FROM x FULL OUTER JOIN y USING (z)

