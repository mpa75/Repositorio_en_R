
#Ejercicio 7

#a)

datos <- sort((round (seq(0, 255, length.out = 60))), decreasing = T)
A <- array(datos, dim=c(3,4,5))

#b)
x1 <- A[3,2,5]
x2 <- A[3,2,4]
x3 <- A[3,2,3]
x4 <- A[3,3,5]
x5 <- A[3,3,4]
x6 <- A[3,3,3]
x7 <- A[1,2,5]
x8 <- A[1,2,4]
x9 <- A[1,2,3]
x10 <- A[1,3,5]
x11 <- A[1,3,4]
x12 <- A[1,3,3]

x <- c(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12)
B <- array(x, dim = c(2,2,3))

#c)
C <- A
C[1,2,1] <- -1
C[3,2,1] <- -1
C[1,2,3] <- -1
C[3,2,3] <- -1
C[1,2,5] <- -1
C[3,2,5] <- -1

#los hace todos 1??
C <- array((c(diag(C[,,1]) <- 1, diag(C[,,2]) <- 1, diag(C[,,3]) <- 1, diag(C[,,4]) <- 1, diag(C[,,5]) <- 1)), dim = c(3,4,5))

#d)

A <- array(data = C, dim = c(3, 4, 5), dimnames = list(c("Fila 1", "Fila 2", "Fila 3"), c("Columna 1", "Columna 2", "Columna 3", "Columna 4")))




