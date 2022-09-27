library(tidyverse)

#forma de representar las dobles comillas y 
#la barra invertida

double_quote <- "\"" # or '"'
single_quote <- '\'' # or "'"

x <- c("\"", "\\")
x
#> [1] "\"" "\\"

#Vemos el contenido sin procesar con writeLines()
writeLines(x)
#> "
#> \

x <- "\u00b5"
x
#> [1] "µ"
#---------------------------------------------------
#Longitud de las cadenas
str_length(c("a", "R for data science", NA))
#> [1]  1 18 NA
#> #------------------------------------------------

#Combinación de cadenas
str_c("x", "y", "z")

str_c("x", "y", "z", sep = ", ")
#> [1] "x, y, z"

#Cosa curiosa, combina dos vectores con las dos órdenes
str_c("prefix-", c("a", "b", "c"), "-suffix")
#> [1] "prefix-a-suffix" "prefix-b-suffix" "prefix-c-suffix"

name <- "Hadley"
time_of_day <- "morning"
birthday <- TRUE
birthday <- FALSE

str_c(
  "Good ", time_of_day, " ", name,
  if (birthday) " and HAPPY BIRTHDAY",
  "."
)
#> [1] "Good morning Hadley."

str_c(c("x", "y", "z"), collapse = ", ")
#> [1] "x, y, z"
#> 
#-----------------------------------------------------

#Extraer subcadenas de una cadena

x <- c("Apple", "Banana", "Pear")
#números positivos extraen desde el principio de la cadena
str_sub(x, 1, 3)
#> [1] "App" "Ban" "Pea"
# numeros negativos extraen desde atras
str_sub(x, -3, -1)
#> [1] "ple" "ana" "ear"

#devuelve tanto como es posible encontrar
str_sub("amor", 1, 5)
#> [1] "a"

#mayusculas<->minusculas
str_to_upper(c("el", "lobo", "se", "comió", "a", "caperucita"))
#>[1] "EL"  "LOBO" "SE"  "COMIÓ"  "A"  "CAPERUCITA"
str_to_lower(c("EL",  "LobO", "SE",  "COMIÓ",  "A",  "CAPERUCITA"))
#>[1] "el"  "lobo" "se" "comió" "a" "caperucita"

#Adaptaciones a idiomas regionales
# Turkish has two i's: with and without a dot, and it
# has a different rule for capitalising them:
str_to_upper(c("i", "ı"))
#> [1] "I" "I"
str_to_upper(c("i", "ı"), locale = "tr")
#> [1] "İ" "I"

x <- c("apple", "eggplant", "banana")

str_sort(x, locale = "es")  # español
#> [1] "apple"    "banana"   "eggplant"

str_sort(x, locale = "haw") # Hawaiian
#> [1] "apple"    "eggplant" "banana"

#Cambiando width crea parrafos con saltos de líneas 
str_wrap("string2 para entender esya función", width = 100)

#str_trim() elimina los caracteres blancos iniciales y finales
str_trim("      la rilo la   ")
#>"la rilo la"











































