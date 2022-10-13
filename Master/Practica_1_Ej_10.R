

#a)

secuencia <- list(seq(-3,3, length.out = 8))
cChar <- c("Hello Word")
vectorM <- c("Malo","Regular","Bueno","Bueno","Excelente","Malo","Malo","Regular")
orden <- c(order(vectorM, decreasing =  FALSE))
factorOr <- factor(vectorM[orden])
matriz <- matrix(c(FALSE,TRUE,FALSE,FALSE,FALSE,TRUE), nrow = 2, ncol = 4, byrow = TRUE)
datos <- list(secuencia, matriz, cChar, factorOr)

names(datos) <- c("secuencia", "MatrizLogica", "cadenaChar", "factorEstado")

#b)

datos[[2]] <- matrix(c((matriz[0,1] <- TRUE), (matriz[1,4] <- TRUE), (matriz[2,1] <- TRUE),
                       (matriz[2,4] <- FALSE)), nrow = 2, ncol = 4, byrow = TRUE)

#c)

#install.packages("stringr")
library(stringr)

datos[[3]] <- str_replace("\\Hello*word!",str_sub(datos[[3]], 1,10), "")


#d)
Paciente <- c("Juan", "Pedro", "Lorena", "Luis", "Genma", "Ana", "Javier", "Paula")
ConsumeDrogas <- c("S", "N", "*", "N", "S", "*", "*", "N")
Peso_kg <- c(85, 70, 58, 91, 60, 63, 100, 55)
Altura_cm <- c(168 ,178, 157, 185, 170, 165, 195, 175)
datosPaciente <- data.frame(Paciente,ConsumeDrogas,Peso_kg, Altura_cm)

datos[["datosPaciente"]] <- datosPaciente[order(datosPaciente$Altura_cm, decreasing = TRUE),] 

datos[["datosPaciente"]]$Peso_kg <- NULL

#1)
datos[["cadenaChar"]] <- NULL


#2)

for (i in 3) {
  datos[["factorEstado"]] <- datos[["factorEstado"]][-i]
}

#e)

datos[["parametros"]] <- c(mean(datos[["datosPaciente"]]$Altura_cm[datos[["datosPaciente"]]$Altura_cm > 170]), sd(datos[["datosPaciente"]]$Altura_cm[datos[["datosPaciente"]]$Altura_cm > 170]), var(datos[["datosPaciente"]]$Altura_cm[datos[["datosPaciente"]]$Altura_cm > 170])) 

datos[["parametros"]] <- NULL
datos[["parametros"]] <- matrix(c(mean(datos[["datosPaciente"]]$Altura_cm[datos[["datosPaciente"]]$Altura_cm > 170]), sd(datos[["datosPaciente"]]$Altura_cm[datos[["datosPaciente"]]$Altura_cm > 170]), var(datos[["datosPaciente"]]$Altura_cm[datos[["datosPaciente"]]$Altura_cm > 170])), nrow = 1,ncol =  3, byrow = T) 
colnames(datos[["parametros"]]) <- c("Media Poblacional", "Desviación Típica", "Varianza")