

#Ejercicio 1

nombre <- "Manuel peiró Agulló"
estatura <- 1.96
num_leng <- "C, C++, Java, SQL"
fumador <- FALSE

class(nombre)
class(estatura)
class(num_leng)
class(fumador)
#--------------------------------------------------

#Ejercicio 2

numeros <- c(0:29)
numeros_condicion <- c((pares_buenos <- (pares <- numeros[(numeros %% 2 == 0)])[(pares <- numeros[(numeros %% 2 == 0)]) < 10]), (impares_buenos <- (impares <- numeros[(!numeros %% 2 == 0)])[(impares <- numeros[(!numeros %% 2 == 0)]) > 20]))

#---------------------------------------------------

#Ejercicio 3

progresion <- c((2*3)^(a <- c(0:10)))
indice <- progresion[(progresion %% 9 == 0)]
indices_condicion <- which((indice <- progresion[(progresion %% 9 == 0)]) < 100)

#------------------------------------------------------------

#Ejercicio 4

#a)
x <- seq(-2, 4, length.out = 100)
f <- dnorm(x, mean = 1, sd = 2, log = FALSE)
plot(x,f)

#b)
x <- 0:49
f <- dbinom(x, 50, 0.5, log = FALSE)
plot(x,f)

#------------------------------------------------------------


















