library(nycflights13)
library(tidyverse)

View(flights)

"
-Seleccione las observaciones por sus valores ( filter()).
-Reordenar las filas ( arrange()).
-Seleccione las variables por sus nombres ( select()).
-Crear nuevas variables con funciones de variables existentes ( mutate()).
-Contraiga muchos valores en un solo resumen ( summarise()).
"
#---------------------------------------------------------------------
#pruebas con filter

filter (flights, month == 3, day == 30)
marzo_30 <- filter (flights, month == 3, day == 30)
(marzo_30 <- filter (flights, month == 3, day == 30))

#near() se utiliza para redondear un número para prevenir una precisión infinita
sqrt(2) ^ 2 == 2
#> [1] FALSE
near(sqrt(2) ^ 2,  2)
#> [1] TRUE
near(1 / 49 * 49, 1)
#> [1] TRUE
#> 
#> operadores lógicos
filter(flights, month == 3 | month == 11)

#vuelos que no se hayan retrasado más de dos horas a l aterrizar o al despegar
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)


#Valores faltantes NA

x <- NA
is.na(x)
#>TRUE
#------------------------------------------------------------------------------------

#Ordenar filas con arrange() -- cambia el orden de las filas
#Los valores faltantes se ordenan al final
arrange(flights, year, month, day)

#en orden descendente
arrange(flights, desc(dep_delay))

#--------------------------------------------------------

#Selecionar columnas con select()

select(flights, year, month, day)

#columnas que hay entre dos columnas, año y dia --> hay tres

select(flights, year:day)

#Todas las columnas excepto las que estan comprendidas en el select

select(flights, -(year:day))


#starts_with("abc"): coincide con nombres que comienzan con "abc".

#ends_with("xyz"): coincide con nombres que terminan en “xyz”.

#contains("ijk"): coincide con nombres que contienen "ijk".

#matches("(.)\\1"): selecciona variables que coinciden con una expresión regular

#num_range("x", 1:3): coincidencias x1y .x2x3

select (flights, starts_with("y"))

#renombrar el nombre de las columnas
rename(flights, tail_num = tailnum)

rename(flights, yeah = year)

#-----------------------------------------------------------

#Añadir al final nuevas variables con mutate()

flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time
)
#muestra todas las que habia y las nuevas
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)
#Muestra solo las nuevas
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)
