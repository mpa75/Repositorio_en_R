
#Ejercicio 5

#a)
#1.
seq(0, 20)
#2.
seq(1, 100, 5)
#3
mismo_vector <- c(seq(0,1, length.out = 30), seq(2, 3, length.out = 15))

#b)
r <- c(3, -1, 4, 2)
#1.
ve <- rep(r,3)
#2
ve1 <- rep(r, each = 4)
#3.
ve3 <- c((rep(r, each = 3)), (rep(r, each = 3, length.out = 3)))

#c)
vV <- seq((-3*pi/2), (3*pi/2), (pi/64))
max(vV)
min(vV)
plot(vV)

#d)
#1.
temperatura <- c(19.9, 14.1, 14.5, 15.8, 18.8, 22.5, 25.7, 26.7, 25.4, 22.7, 19.1, 16.4)
temMedia <- (sum(temperatura))/(length(temperatura))
mean(temperatura)

#2.
sort(temperatura) #ascendente
sort(temperatura, decreasing = T) #descendente

sort(temperatura, index.return=T)
sort(temperatura, decreasing = T, index.return=T)

#e)
x <- seq(1, 10000)
proWallie <- prod((4*x^2)/(4*x^2-1))

#f)
casos <- c(256,186,251,320,338,297,317,295,240,365,363,431,409,478,390,339,506,501,524,547,589,549,418,600,502,601,479,539,531,306,320)
casosAcumulados <- cumsum(casos)
barplot(casos, names.arg = 1:31)
barplot(casosAcumulados, names.arg = 1:31)

#g)
p <- c("Estas", "son", "mis", "palabras")
rev(x) #Crea un vector reverso del original
rev(p) #Puede ser útil para el calculo de valores en vectores

#------------------------------------------------------------


