
install.packages("htmlwidgets")
library(htmlwidgets)
library(tidyverse)

#-------------BASICO-----------------------------------
x <- c("apple", "banana", "pear")
str_view(x, "an")
str_view(x, ".a.")

# To create the regular expression, we need \\
dot <- "\\."

# But the expression itself only contains one:
writeLines(dot)
#> \.

# And this tells R to look for an explicit .
str_view(c("abc", "a.c", "bef"), "a\\.c")

#Para conseguir una barra invertida hemos de poner cuatro
x <- "a\\b"
writeLines(x)
#> a\b

str_view(x, "\\\\")
#-----------------------------------------------------------
#----------------ANCLAJES-----------------------------------
#  ^ para que coincida con el comienzo de la cadena
#  $ para que coincida con el final de la cadena.

x <- c("apple", "banana", "pear")
str_view(x, "^a")

str_view(x, "a$")

#Para que coincida con una cadena entera

x <- c("apple pie", "apple", "apple cake")
str_view(x, "apple")

#aseguramos con ^ ó $ si no nos da el string entero
str_view(x, "^apple$")

#Buscamos carácteres en expresiones
x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
str_view(x, "CC+")
str_view(x, 'C[LX]+')

#{n}: exactamente n
str_view(x, "C{2}")
#{n,}: n o más
str_view(x, "C{2,}")
#{n,m}: entre n y m
str_view(x, "C{2,3}")

#encuentra repeticiones de caracteres
str_view(fruit, "(..)\\1", match = TRUE)

#palabras que contienen el carater con un boleano
x <- c("apple", "banana", "pear")
str_detect(x, "e")

#palabras que contienen un carater
sum(str_detect(words, "^t"))

#proporción de palabras que terminan con uncaracter
mean(str_detect(words, "[aeiou]$"))

#palabras que no contienen vocales
(no_vowels <- !str_detect(words, "[aeiou]"))

#numero de veces que se repite una vocal
x <- c("apple", "banana", "pear")
str_count(x, "a")

#número de vocales por palabra
mean(str_count(words, "[aeiou]"))

#número de veces que se repite un patrón
str_count("abababa", "aba")
#> [1] 2
str_view_all("abababa", "aba")

#EXTRAER COINCIDENCIAS
length(sentences)
head(sentences)

#Creamos un vector de colores y luego lo convertimos
#expresión regular separado por |
colours <- c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c(colours, collapse = "|")
colour_match
#> [1] "red|orange|yellow|green|blue|purple"

#Seleccionamos las horaciones que tienen colores
has_colour <- str_subset(sentences, colour_match)
has_colour

#extraemos los colores
matches <- str_extract(has_colour, colour_match)
head(matches)

#oraciones con más de un color
more <- sentences[str_count(sentences, colour_match) > 1]
more
str_view_all(more, colour_match)

#Devuelve listas con los colores de cada oración
str_extract_all(more, colour_match)

#Para crear expresiones regulares

dot <- "\\."

writeLines(dot)

str_view(c("abc", "a.c", "bef"), "a\\.c")


#BUSCAMOS SUSTANTIVOS
#>cualquier palabra que venga después de “a” o “the”.
#>Definir una "palabra" en una expresión regular es un
#>poco complicado, así que aquí uso una aproximación simple:
#>una secuencia de al menos un carácter que no es un espacio.

#Creamos la expresión regular
noun <- "(a|the) ([^ ]+)"

#Cojemos las frases que cumplen la expresión regular
has_noun <- sentences %>%
  str_subset(noun) %>%
  head(10)
has_noun

#Estraemos los sustantivos con su artículo "the" o con "a"
has_noun %>% 
  str_extract(noun)

#Con str_match("") nos lo detalla y por frases
has_noun %>% 
  str_match(noun)

#Podemos remplazar coincidencias con nuevos carateres o cadenas
x <- c("apple", "pear", "banana")
str_replace(x, "[aeiou]", "-")

str_replace_all(x, "[aeiou]", "sustitucion")

#Sustituimos numerales por cadenas 
x <- c("1 house", "2 cars", "3 people")
str_replace_all(x, c("1" = "one", "2" = "two", "3" = "three"))

#Dividimos oraciones en palabras sueltas
sentences %>%
  head(5) %>% 
  str_split(" ")


#Identificamos palabras coincidentes

bananas <- c("banana", "Banana", "BANANA")
str_view(bananas, "banana")
#ignoramos mayúsculas y minúsculas
str_view(bananas, regex("baNAna", ignore_case = TRUE))





















































































