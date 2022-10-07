
library(tidyverse)
install.packages("car")
library(car)

#a)

alcohol <- c("N", "S", "S", "N", "S", "N", "N", "S", "S", "S")

alcoholFactor <- factor(recode(alcohol, "1=1;4=1;6:7=1;2:3=2;5=2;8:10=2"),
                         labels = c("No", "Sí"))

#b)

fuma <- c(0,1,0,1,0,0,0,1,1,1)
fumaFactor <- factor(recode(fuma, "1=1;2=2;3=1;4=2;5:7=1;8:10=2"),
                     labels = c("Fuma", "No fuma"))

#c)

deporte <- c("Poco", "Nada", "Bastante", "Normal", "Normal", "Poco", "Normal", "Bastante","Poco", "Nada")
deporteFactor <- factor(deporte)

'El problema que encuentro es que crea un nivel en el factor distinguiendo
por mayúsculas ó minúsculas, aunque la palabra sea la misma'

#d)

deporteFactor <- factor(recode(deporte, "1=1; 4=2; 8=3; 10=4"),
                        lebels = c("Nada", "Poco", "Normal", "Bastante"))

plot(deporteFactor) #Los ordena por tamaño de muestra -> Bastante, Nada, Normal, Poco

#e)
deporteFactorOrd <- factor(deporteFactor, levels = sort(levels(deporteFactor)))
plot(deporteFactorOrd)

#f)
summary(deporteFactorOrd, "Normal" = T)

#g)
str(alcohol)
str(alcoholFactor)

'Devuelve el tipo de cada elemento de un factor, si es ch (char) o una
vocal(w), y el tamaño de cada una de ellas. También la posición que ocupan'





