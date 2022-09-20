library(tidyverse)
 

#En un tribble, la columna es una variable
#y la fila es un sujeto, ¿objeto?

       
as_tibble(iris)     

tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)

tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)
tb

tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)

#runif() genera números (en este caso fechas), aleatoriamente

tibble(
  a = lubridate::now(),
  b = lubridate::today(),
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)
tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)


#n-> número de filas y width = Inf -> mostrará todas las columnas
#aunque no cojan en pantalla
nycflights13::flights %>% 
  print(n = 10, width = Inf)

#Para imprimir todas las filas
options(tibble.print_max = n, tibble.print_min = m)

#Para ver TODO en pantalla
nycflights13::flights %>% 
  View()

#rnorm() -> es random normal
df <- tibble(
  x = runif(5),
  y = rnorm(5)
)
df$x # -> sale solo los valores x
df$y # -> sale solo los valores y

