

#a)

secuencia <- list(seq(-3,3, length.out = 8))
vLog <-  c(FALSE,TRUE,FALSE,FALSE,FALSE,TRUE)
cChar <- c("Hello Word")
vectorM <- c("Malo","Regular","Bueno","Bueno","Excelente","Malo","Malo","Regular")
orden <- c(order(vectorM, decreasing =  FALSE))
factorOr <- factor(vectorM[orden])
matriz <- matrix(vLog, nrow = 2, ncol = 4, byrow = TRUE)
datos <- list(secuencia, matriz, cChar, factorOr)

names(datos) <- c("secuencia", "MatrizLogica", "cadenaChar", "factorEstado")

#b)
