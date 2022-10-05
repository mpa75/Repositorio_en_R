#Ejercicio 6

#a)
v <- c(3.1, 5.3, 2, 3.5,-1.4, 2.7, 4.1, -5.3, 2.3, 3.7, -1, 0)
A <- matrix(v, nrow = 3, ncol =  4, byrow = T)
B <- matrix(v, nrow = 3, ncol =  4)

#b)
#1.
A[2,3] <- 5
A[2,] <- 0
A[,3] <- -1

#2.

#Me da error pero funciona, hace la matriz
A <- A[(A[1,1] <- 10), (A[1,4] <- 10), (A[3,1] <- 10), (A[3,4] <- 10)]

#3.
D <- -A[,-2]
diag(D) <- 3


#Esta sentencia la he encontrado en internet y he cambiado algunos términos
#Verdaderamente funciona, pero me cuesta entenderla.
D <- sapply(1:nrow(matrix(3,ncol=3,nrow=3)), FUN=function(x) {v<-rep(0,nrow(matrix(3,ncol=3,nrow=3)));v[x]<-(matrix(3,ncol=3,nrow=3))[x];v})

#c)
#1.
ren <- c(23699,24091,23826,32163,34007,32179,22790,23048,24565,23034,25207,23176,32451,33055,35587,23574,24801,24448)
rentas <- matrix(ren, nrow = 6, ncol = 3, byrow = T)
#2.
#3.
colnames(rentas) <- c(2017,2018,2019)
rownames(rentas) <- c("Andalucia", "Islas Baleares", "Canarias", "C. Valenciana", "C. de Madrid", "R de Murcia")
media_anual <- (rowSums(rentas)/3)
media_ccaa <- (colSums(rentas)/6)
rentas <- cbind(rentas, media_anual)
rentas <- rbind(rentas, media_ccaa)

#d)

A_v <- c(1,-1,0,3,2,0,1,0,3,5,0,2,-2,-3,-1,0)
B_v <- c(1,0,0,1,2,-1,-3,0,0,0,0,1-1,0,0,0)
C_v <- c(1,0,0,0,0,2,0,0,0,0,3,0,0,0,0,4)
length(C_v)
A <- matrix(A_v, nrow = 4, ncol = 4, byrow = T)
B <- matrix(B_v, nrow = 4, ncol = 4, byrow = T)
C <- matrix(C_v, nrow = 4, ncol = 4, byrow = T)

result <- (0.5*(A + t(B)) - 3*(C^(-1))*C)

install.packages("MASS")
library(MASS)

fractions(result)
