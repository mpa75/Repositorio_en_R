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
A <- A[(A[1,1] <- 10), (A[1,4] <- 10), (A[3,1] <- 10), (A[3,4] <- 10)]

#3.
D <- -A[,-2]
diag(D) <- 3
D <- sapply(1:nrow(matrix(3,ncol=3,nrow=3)), FUN=function(x) {v<-rep(0,nrow(matrix(3,ncol=3,nrow=3)));v[x]<-(matrix(3,ncol=3,nrow=3))[x];v})