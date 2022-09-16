
#VARIANZA CON UNA VARIABLE CATEGÓRICA

#Como varía el precio de un diamante con su calidad
ggplot(data = diamonds, mapping = aes(x = price)) + 
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)

#precio por corte utilizando geom_boxplot()
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

#Pasamos a los autos para reordenar la imagen proyecteada con reorder()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))

#Y cambiar los ejes con coord_flip()
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

#COVARIANZA CON DOS VARIABLEs CATEGÓRICAs

#Contamos el número de observaciones para cada combinación

diamonds %>% 
  count(color, cut)

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

#ahora juntos con una buena estética de relleno
diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

#COVARIANZA ENTRE DOS VARIABLES CONTINUAS

#relación entre el tamaño en quilates y el precio de un diamante.
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)

#>geom_bin2d()y geom_hex()divida el plano de coordenadas en contenedores 2d
#> y luego use un color de relleno para mostrar cuántos puntos caen en cada
#>  contenedor. geom_bin2d()crea contenedores rectangulares. 
#>  geom_hex()crea contenedores hexagonales. Deberá instalar el paquete hexbin
#>   para usar geom_hex().
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

#para usar geom_hex(), hay que instalar el paquete hexbin
install.packages("hexbin")

ggplot(data = smaller) +
  geom_hex(mapping = aes(x = carat, y = price))