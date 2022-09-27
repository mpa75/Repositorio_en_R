
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







































































