View(who)
who

#agrupamos en key todas las columnas
#y le contamos el total de casos
(who1 <- who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  ))

#contamos cada columna cuantos casos tiene
who1 %>% 
  count(key)
#o cada país
who1 %>% 
  count(country)
#rel significa recaída
#>ep significa casos de tuberculosis extrapulmonar
#sn significa casos de TB pulmonar que no se pudieron diagnosticar mediante un frotis pulmonar (frotis negativo)
#sp significa casos de tuberculosis pulmonar que podrían diagnosticarse mediante un frotis pulmonar (frotis positivo)
#La sexta letra da el sexo de los pacientes con tuberculosis. El conjunto de datos agrupa los casos por hombres ( m) y mujeres ( f).

#Los números restantes dan el grupo de edad. El conjunto de datos agrupa los casos en siete grupos de edad:
  
#014= 0 – 14 años
#1524= 15 – 24 años
#2534= 25 – 34 años
#3544= 35 – 44 años
#4554= 45 – 54 años
#5564= 55 – 64 años
#65= 65 años o más

#replazamos newrel por new_rel, asi tendrán todos el mismo formato
who2 <- who1 %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2

#ahora separamos todo el código en nuevo, tipo y masculino, femenino
#y tramo de edad
who3 <- who2 %>% 
  separate(key, c("nuevo", "tipo", "sexo"), sep = "_")
who3

#hacemos "nuevo" columna constante
who3 %>%
  count(nuevo)

#eliminamos las columnas nuevo, iso2 y iso3
who4 <- who3 %>% 
  select(-nuevo, -iso2, -iso3)
who4
#separamos el sexo y el rango de edad
who5 <- who4 %>% 
  separate(sexo, c("sexo", "tramo_edad"), sep = 1)
who5

#Todo en una orden
who %>%
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "numero_casos", 
    values_drop_na = TRUE
  ) %>% 
  mutate(
    key = stringr::str_replace(key, "newrel", "new_rel")
  ) %>%
  separate(key, c("new", "tipo_enfermedad", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sexo", "edad"), sep = 1)




