library(tidyverse)
library(dplyr)
#a)
Paciente <- c("Juan", "Pedro", "Lorena", "Luis", "Genma", "Ana", "Javier", "Paula")
ConsumeDrogas <- c("S", "N", "*", "N", "S", "*", "*", "N")
Peso_kg <- c(85, 70, 58, 91, 60, 63, 100, 55)
Altura_cm <- c(168 ,178, 157, 185, 170, 165, 195, 175)

datosPaciente <- data.frame(Paciente,ConsumeDrogas,Peso_kg, Altura_cm)

#b)

nuevoPaciente  <- c("Miguel", "N", 110, 180)
datosPaciente <- rbind(nuevoPaciente, datosPaciente)

Paciente <- c("Juan", "Pedro", "Lorena", "Olga","Luis", "Genma", "Ana", "Javier", "Paula")
ConsumeDrogas <- c("S", "N", "*", "*","N", "S", "*", "*", "N")
Peso_kg <- c(85, 70, 58, 61,91, 60, 63, 100, 55)
Altura_cm <- c(168 ,178, 157, 172, 185, 170, 165, 195, 175)

datosPaciente <- data.frame(Paciente,ConsumeDrogas,Peso_kg, Altura_cm)

nuevoPaciente  <- c("Miguel", "N", 110, 180)
datosPaciente <- rbind(nuevoPaciente, datosPaciente)

#c)

datosPaciente$Altura_cm <- NULL
Altura_m <- c(1.80, 1.68 ,1.78, 1.57, 1.72, 1.85, 1.70, 1.65, 1.95, 1.75)
datosPaciente <- cbind(datosPaciente, Altura_m)


peso <- as.numeric(as.character(datosPaciente[, 3]))
altura <- datosPaciente[, 4]
imc <- round(peso/(altura^2), 1)
datosPaciente <- cbind(datosPaciente, imc)


categoria_del_IM_factor <- factor(c("Infrapeso", "Saludable", "Sobrepeso", "Obeso", "Obesidad extrema"))

#imc < 18.5) = 1;((imc >= 18.5) & (imc < 25)) =2; ((imc >= 25) & (imc < 30)) =3;((imc >= 30) & (imc < 40)) =4;(imc >= 40) =5"



#d)
M <- substr(datosPaciente[1,1], 1,1)
J <- substr(datosPaciente[2,1], 1,1)
P <- substr(datosPaciente[3,1], 1,1)
L <- substr(datosPaciente[4,1], 1,1)
O <- substr(datosPaciente[5,1], 1,1)
L <- substr(datosPaciente[6,1], 1,1)
G <- substr(datosPaciente[7,1], 1,1)
A <- substr(datosPaciente[8,1], 1,1)
J <- substr(datosPaciente[9,1], 1,1)
P <- substr(datosPaciente[10,1], 1,1)

iniciales <- c(M,J,P,L,O,L,G,A,J,P)
num <- seq(1, 10)
cadenas <- paste("P ", num, "-", iniciales, sep = "")
row.names(datosPaciente) <- cadenas

#e)
# No encuentro la relación del orden fuera de la columna de drogas

#orden <- order(datosPaciente$ConsumeDrogas, decreasing = T)
orden <- c(7,2, 10,3,6,1,5,8,2,9)
datosPacienteOrd <- datosPaciente [orden,]

#f)

#1.

datosNC <- datosPacienteOrd[datosPacienteOrd$ConsumeDrogas == "*",]
datosNC <- datosNC[order(datosNC$Paciente, decreasing = FALSE),]
datosNC$ConsumeDrogas <- NULL

#2.

datosDrogas <- datosPacienteOrd[datosPacienteOrd$ConsumeDrogas != "*",]
datosDrogas <- datosDrogas[order(datosDrogas$Paciente, decreasing = FALSE),]


datosDrogas$Peso_kg <- NULL
datosDrogas$Altura_m <- NULL








