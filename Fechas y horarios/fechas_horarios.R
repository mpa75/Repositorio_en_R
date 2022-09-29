library(tidyverse)

#Para fechas y horas
library(lubridate)
#Paquete de los vuelos
library(nycflights13)

today() #hoy

now() #ahora


#Datos desde los strings

ymd("2017-01-31")
#> [1] "2017-01-31"
mdy("January 31st, 2017")
#> [1] "2017-01-31"
dmy("31-Jan-2017")
#> [1] "2017-01-31"

#aceptan números sin comillas
ymd(20170131)

ymd_hms("2017-01-31 20:11:59")
ymd_hms(20170131201159)