library(tidyverse)
library(nycflights13)

#airlines le permite buscar el nombre completo del 
#operador a partir de su código abreviado:
airlines

#airports da información sobre cada aeropuerto, 
#identificado por el faa código de aeropuerto:
airports
View(airports)

#planes da información sobre cada avión, identificado por su 
#número de cola tailnum
planes

#weather da el tiempo en cada aeropuerto de Nueva York 
#para cada hora:
weather

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

flights %>% 
  count(year, month, day, flight) %>% 
  filter(n > 1)

flights %>% 
  count(year, month, day, tailnum) %>% 
  filter(n > 1)