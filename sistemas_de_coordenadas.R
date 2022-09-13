ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

#El apilamiento se realiza automáticamente mediante el ajuste de posición especificado por el positionargumento.

ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(alpha = 1/5, position = "identity")
#----------------------------------------------------------------------------------------------------
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + 
  geom_bar(fill = NA, position = "identity") +
  #coord_polar() para convertir un gráfico de barras en un gráfico polar
  coord_polar()
#coord_flip()

#-----------------------------------------------------------------------------------

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

#Barras por grupos con dodge

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#agrega una pequeña cantidad de ruido aleatorio a cada punto para no sobreponer los puntos
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_jitter()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_count()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()


ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()





bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()