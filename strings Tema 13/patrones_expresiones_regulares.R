
install.packages("htmlwidgets")
library(htmlwidgets)

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

























