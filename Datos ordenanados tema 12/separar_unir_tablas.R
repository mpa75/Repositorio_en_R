library(tidyverse)
#-------------------------------------------------------------
#SEPARAR

#separate separa una columna en varias columnas
table3
#dividimos la columna rate en cases y population
#lo hace siempre que vea un caracter no alfanumérico 
table3_separada <- table3 %>% 
  separate(rate, into = c("cases", "population"))
table3_separada

#si queremos una separación por un caracter específico con ->sep = 
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")

#para un mejor formato con convert = TRUE
table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE)

#separ por dígitos, aqui el año -> siglo y año
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
#-------------------------------------------------------------------
#UNIR

table5 

#añade guión bajo
table5 %>%
  unite(fecha_nueva, century, year)

#añadimos la separación que queremos, en este caso "" nada
table5 %>% 
  unite(new, century, year, sep = "")
