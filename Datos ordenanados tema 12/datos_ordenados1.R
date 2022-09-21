
library(tidyverse)
table1

#Cada variable debe tener su propia columna.
#Cada observación debe tener su propia fila.
#Cada valor debe tener su propia celda.

table1 %>% 
  mutate(rate = cases / population * 10000)

table1 %>% 
  count(year, wt = cases)

ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))


#tablas sin nombre en las columnas
table4a

#asignamos nombres a las columnas
table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

table4b
#igual
table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")

tidy4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
tidy4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
left_join(tidy4a, tidy4b)

ggplot(tidy4b, aes(year, population)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))
tidy4b


table2
#asocia el type y el count por el string asociado en type
table2 %>%
  pivot_wider(names_from = type, values_from = count)

table4a

table4a %>% 
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "cases")
