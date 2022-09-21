
#convierte la lectura de unos datos almacenados en un archivo
#en este caso .csv
write.csv(nacimientos, "nacimientos.csv")
write.csv(diamonds, "datos_diamantes.csv")

View(diamonds)


#Escribir en formato .rds -> es un formato binario
#y más fiable
write_rds(diamonds, "diamonds.rds")
read_rds("diamonds.rds")

#Escribir en formato 'pluma' -> feather otro formato binario
install.packages("feather")
library(feather)

write_feather(diamonds, "diamonds.feather")
read_feather("diamonds.feather")

#ambos formatos anteriores se pueden exportar a otros idiomas


#PARA LEER EXCEL
install.packages(c("readxl", "dplyr"))

library(readxl)
library(dplyr)

#Conocer que pestaña tine el excel
excel_sheets("excel_prueba.xlsx")

#primera pestaña: ->
primera_pestana <- read_excel("excel_prueba.xlsx")
#su estructura
primera_pestana %>% str()
#resumen del contenido
primera_pestana %>% summary()
#primeros renglones
primera_pestana %>% head()
#últimos renglones
primera_pestana %>% tail()
#<-

#segunda pestaña
segunda_pestana <- read_excel("excel_prueba.xlsx",sheet = )
