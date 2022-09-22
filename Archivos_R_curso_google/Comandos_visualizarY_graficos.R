
head(diamonds) #ver datos

str(diamonds) #Ver datos

glimpse(diamonds)#Ver datos

colnames(diamonds) #Nombres de columnas

rename(diamonds, carat_new = carat) #Cambia el nombre de columnas
rename(diamonds, carat_new = carat, cut_new = cut) #Varios renombres de columnas

summarize(diamonds, mean_carat = mean(carat))

#visualizar datos
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point()

#Visualiza datos añadiendo colores
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point()

#para visualizar por tipos de datos
ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() +
  facet_wrap(~cut)