library(tidyverse)

#>read_csv()lee archivos delimitados por comas,
#> read_csv2()lee archivos separados por punto
#>  y coma (común en países donde ,se usa como lugar decimal),
#>   read_tsv()lee archivos delimitados por tabuladores y
#>    read_delim()lee archivos con cualquier delimitador
#>    
#>read_fwf()lee archivos de ancho fijo. Puede especificar campos
#>por sus anchos fwf_widths()o por su posición con fwf_positions().
#>read_table()lee una variación común de archivos de ancho fijo
#>donde las columnas están separadas por espacios en blanco. 
#>
#>read_log()lee archivos de registro de estilo Apache.
#>(Pero también echa un vistazo a webreadr , que se basa en 
#>read_log()y proporciona muchas más herramientas útiles).


heights <- read_csv("data/heights.csv")
nacimientos <- read.csv("nacimientos.csv", header=FALSE, stringsAsFactors=FALSE, fileEncoding="latin1")

View(nacimientos)
read_csv("a,b,c
1,2,3
4,5,6")

# skip para saltarse las primeras n filas -> skip = n
read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3", skip = 2)

#Para comentar todas las filas que empiezen por un #
read_csv("# A comment I want to skip
  x,y,z
  1,2,3", comment = "#")

#para secuenciar las columnas que no tienen nombre con X1, X2, Xn
read_csv("1,2,3\n4,5,6", col_names = FALSE)

#Para agregar nombres a las columnas -> col_names
read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))
#con \n se van añadiendo filas a las columnas

#con na = "." se añaden NA a los valores que faltan
read_csv("a,b,c\n1,2,.", na = ".")


