install.packages("lubridate", dependencies = TRUE)
library(lubridate)
#parse_*() funciones
str(parse_logical(c("TRUE", "FALSE", "NA")))
#>  logi [1:3] TRUE FALSE NA
str(parse_integer(c("1", "2", "3")))
#>  int [1:3] 1 2 3
str(parse_date(c("2010-01-01", "1979-10-14")))
#>  Date[1:2], format: "2010-01-01" "1979-10-14"


#El "." se asigna a los valores NA
parse_integer(c("1", "231", ".", "456"), na = ".")

#Si el análisis falla manda warnings
x <- parse_integer(c("123", "345", "abc", "123.45"))
x
#para tener un análisis completo de los errores
problems(x)

#ANALIZADORES
#>parse_logical() 
#>parse_integer()
#>parse_doble()
#>parse_character()
#>parse_vector()
#>parse_datetime(), parse_date(),parse_time()
#>
#>NUMEROS

#parse_number() ignora carácteres numéricos antes y después del número
parse_number("$100")
#> [1] 100
parse_number("20%")
#> [1] 20
parse_number("It cost $123.45")
#> [1] 123.45
# Used in America
parse_number("$123,456,789")
#> [1] 123456789

# Used in many parts of Europe
parse_number("123.456.789", locale = locale(grouping_mark = "."))
#> [1] 123456789

# Used in Switzerland
parse_number("123'456'789", locale = locale(grouping_mark = "'"))
#> [1] 123456789

#> CADENAS
#>charToRaw() -> convierte una cadena a bytes Hexadecimal->ASCII
charToRaw("Manolito")
charToRaw("El Jordi")


x1 <- "El Ni\xf1o was particularly bad this year"
#UTF-8
x2 <- "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"
x1
#R tiene distintas codificaciones en distintos lugares del mundo
parse_character(x1, locale = locale(encoding = "Latin1"))
parse_character(x2, locale = locale(encoding = "Shift-JIS"))
parse_character(x2, locale = locale(encoding = "Latin1"))

#guess_encoding() -> dice el tipo de codificación en que está
guess_encoding(charToRaw(x1))

#FACTORES
fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)

#FECHAS, FECHAS-HORAS y HORAS

u<-now("GMT")
library(tidyverse)

parse_datetime("2022-09-21T1035")
parse_datetime("20101010")

parse_date("2010-10-01")
parse_date("01/02/15", "%m/%d/%y")
#> [1] "2015-01-02"
parse_date("01/02/15", "%d/%m/%y")
#> [1] "2015-02-01"
parse_date("01/02/15", "%y/%m/%d")
#> [1] "2001-02-15"


parse_date("21 septiembre 2022", "%d %B %Y", locale = locale("es"))


