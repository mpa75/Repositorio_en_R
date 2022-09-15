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
#muestra todas lascolumnas que habia y las nuevas
mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60
)
#Muestra solo las columnas nuevas
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)

#--------------------------------------------------------------------
#division de enteros
4%/%2
#> [1] 2
4%/%3
#> [1] 1

#resto
7%%3
#> [1] 1
log2(8)
#> [1] 3
log10(1000)
#> [1] 3
log(2)

#-----------------------------------------------------

#Agregdos, acumuativos y móviles

x <- 1:10
#>  [1]  1  2  3  4  5  6  7  8  9 10
cumsum(x)
#>  [1]  1  3  6 10 15 21 28 36 45 55
cummean(x)
#>  [1] 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5
cumprod(x)
#> [1] 1 2 6 24 120 720 5040 40320 362880 3628800
cummin(x)
#> [1] 1 1 1 1 1 1 1 1 1 1
cummax(x)
#>  [1]  1  2  3  4  5  6  7  8  9 10

y <- c(1, 2, 2, NA, 3, 4)
min_rank(y)
#> [1]  1  2  2 NA  4  5
min_rank(desc(y))

row_number(y)
#> [1]  1  2  3 NA  4  5
dense_rank(y)
#> [1]  1  2  2 NA  3  4
percent_rank(y)
#> [1] 0.00 0.25 0.25   NA 0.75 1.00
cume_dist(y)
#> [1] 0.2 0.6 0.6  NA 0.8 1.0

#------------------------------------------------------

#summaryse() contrae un marco de datos en una sola fila
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))
#> # A tibble: 1 x 1
#>   delay
#>   <dbl>
#> 1  12.6
#> 

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

#Vuelos grupales por destino.
by_dest <- group_by(flights, dest)

#Resuma para calcular la distancia, el retraso promedio y el número de vuelos
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)

#Filtramos para eliminar los puntos ruidosos y el aeropuerto de Honolulu
delay <- filter(delay, count > 20, dest != "HNL")

#Hallamos el gráfico
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

#otra forma de hacerlo
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")
#> `summarise()` ungrouping output (override with `.groups` argument)

flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay)) 

#Eliminamos los vuelos cancelados
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))

#------------------------------------------------------------------------------

#Conteos de valores que cumplen condiciones

#>Aviones identificados/agrupados por su número de cola
#>que tienen los retrasos medios más altos
delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )
ggplot(data = delays, mapping = aes(x = delay)) + 
  geom_freqpoly(binwidth = 10)

#>Cantidad de vuelos frente al 
#>retraso promedio
delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()# n es el número de valores de un vector
  )
ggplot(data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

delays %>% 
  filter(n > 25) %>% 
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

#Ahora con bateadores
batting <- as_tibble(Lahman::Batting)
batters <- batting %>% 
  group_by(playerID) %>% 
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )

batters %>% 
  filter(ab > 100) %>% 
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point() + 
  geom_smooth(se = FALSE)

batters %>% 
  arrange(desc(ba))

#----------------------------------------------------------------------

#Funciones de resúmenes útiles

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    avg_delay1 = mean(arr_delay),
    avg_delay2 = mean(arr_delay[arr_delay > 0]) # the average positive delay
  )

#>Medidas de esparcimiento: sd(x), IQR(x), mad(x).

#> La raíz de la desviación cuadrática media, o desviación estándar sd(x)
#>  es la medida estándar de la dispersión. El rango intercuartílico IQR(x)
#>  y la desviación absoluta mediana mad(x) son equivalentes robustos que pueden
#>   ser más útiles si tiene valores atípicos
not_cancelled %>% 
  group_by(dest) %>% 
  summarise(distance_sd = sd(distance)) %>% 
  arrange(desc(distance_sd))

#>Medidas de rango: min(x), quantile(x, 0.25), max(x). 
#>Los cuantiles son una generalización de la mediana. Por ejemplo, quantile(x, 0.25)
#> encontrará un valor de xque sea mayor al 25% de los valores y menor al 75% restante
not_cancelled %>% 
group_by(year, month, day) %>% 
  summarise(
    first = min(dep_time),
    last = max(dep_time)
  )

#podemos encontrar la primera y la última salida de cada día
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    first_dep = first(dep_time), 
    last_dep = last(dep_time)
  )

not_cancelled %>% 
  group_by(year, month, day) %>% 
  mutate(r = min_rank(desc(dep_time))) %>% 
  filter(r %in% range(r))

#> Para contar el número de valores que no faltan, utilice sum(!is.na(x)).
#>  Para contar el número de valores distintos (únicos), use n_distinct(x)
not_cancelled %>% 
group_by(dest) %>% 
  summarise(carriers = n_distinct(carrier)) %>% 
  arrange(desc(carriers)) 


last()#último valor de un vector
n()#número de valores de un vector
n_distinct()#número distintos de valores de un vector
nth()#extraer el valor que ocupa la posición n en un vector

not_cancelled %>% 
  count(dest)

#Número de millas que voló, por avión
not_cancelled %>% 
  count(tailnum, wt = distance)

#Número de vuelos que salieron antes de las 5:00
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(n_early = sum(dep_time < 500))

#Proporción de vuelos que sufrieron un retraso 
#superior a una hora

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(hour_prop = mean(arr_delay > 60))

#------------------------------------------------------------------

#Agrupar por múltiples variables

#Número de aviones por compañia, por dia, mes y año

daily <- group_by(flights, year, month, day)

(per_day   <- summarise(daily, flights = n()))

(per_month <- summarise(per_day, flights = sum(flights)))

(per_year  <- summarise(per_month, flights = sum(flights)))

#--------------------------------------------------------------------

#deshacer agrupamientos

daily %>% 
  ungroup() %>%             
  summarise(flights = n())

#-----------------------------------------------------------------------

#Mutaciones agrupadas (y filtros)

#Vuelos con más retraso
flights_sml %>% 
  group_by(year, month, day) %>%
  filter(rank(desc(arr_delay)) < 10)

#Compañias con un número de vuelos superior a un número dado
popular_dests <- flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)
popular_dests

#Calcula una métrica donde haya la proporción del retraso
#que tienen los vuelos que tienen retraso, y presenta el 
#dia, mes, año, el retraso y la proporcion del retraso
