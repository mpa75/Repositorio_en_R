
#Creamos el marco de datos con dos vectores primero
names <- c("Peter", "Jennifer", "Julie", "Alex")
age <- c(15, 19, 21, 25)
#con el data.frame lo creamos
people <- data.frame(names, age)

#lo inspeccionamos
head(people)
str(people)
glimpse(people)
colnames(people)

#Cambiamos la columna age
mutate(people, age_in_20 = age + 20)


#Creamos otro marco de datos
fruit <- c("Lemon", "Blueberry", "Grapefruit", "Mango", "Strawberry")
rank <- c(4, 2, 5, 3, 1)
fruit_ranks <- data.frame(fruit, rank)
