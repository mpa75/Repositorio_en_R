
install.packages("ggplot2")
install.packages("palmerpenguins")
library(ggplot2)
library(palmerpenguins)
data("penguins")
View(penguins)
#  geom_point  ---------------------------------------------------------------------------------------------------------------------------------
#colores
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g, color=species))
#formas
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g, shape=species))
#ambas cosas
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g,shape=species, color=species))
#y tamaño
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g, color=species, size=species,shape=species))
#con apha
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g, alpha=species))
#con color elegido
ggplot(data = penguins) +geom_point(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g), color="purple")
#ejemplo etetica
ggplot(data=penguins)+ geom_point(mapping=aes(x = flipper_length_mm, y =
                                        body_mass_g, color=species, size=species, shape = species)) 
#---------------------------------------------------------------------------------------------------------------------------
#otras figuras de gráficos


#linea
ggplot(data = penguins) +geom_smooth(mapping = aes(x = flipper_length_mm, y =
                                                    body_mass_g))
#lineas con diferentes colores según tipo
ggplot(data = penguins) +geom_smooth(mapping = aes(x = flipper_length_mm, y =
                                                     body_mass_g, color=species))
#dispersion y linea
ggplot(data = penguins) +geom_smooth(mapping = aes(x = flipper_length_mm, y =
                                                     body_mass_g))+
  geom_point(mapping = aes(x = flipper_length_mm, y =
                             body_mass_g))

#con jitter
ggplot(data = penguins) +geom_jitter(mapping = aes(x = flipper_length_mm, y =
                                                     body_mass_g))
#--------------------------------------------------------------------------
#con diamantes barras
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut,color=cut))
#con fill un color en el interior de cada barra
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut,fill=cut)) + facet_wrap(~cut) 
#barras de diferentes colores
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=cut,fill=clarity))

#facetas. Separa en diagramas cada variable
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
         geom_point(aes(color=species)) + facet_wrap(~species) +
  labs(title ="Palmer Penguis: Body Mass vs. Fliper Length")
#con facet_wrap
ggplot(data = diamonds)+
  geom_bar(mapping=aes(x=color,fill=cut))+
  facet_wrap(~cut)
#con facet_grid->dos variables
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) + facet_grid(sex~species) +
  labs(title ="Palmer Penguis: Body Mass vs. Fliper Length")


#TITULO Y SUBTITULO
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) + facet_grid(sex~species) +
  labs(title ="Palmer Penguis: Body Mass vs. Fliper Length", subtitle = "Ejemplo con trres cases de pinguinos")
#CON LEYENDAS
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) + facet_grid(sex~species) +
  labs(title ="Palmer Penguis: Body Mass vs. Fliper Length", caption = "Datos de Dr. Kristen Gorman")
#INFORMACIÓN DENTRO DEL GRÁFICO
ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) +
  labs(title ="Palmer Penguis: Body Mass vs. Fliper Length")+
  annotate("text",x=220, y=3500, label = "Te Gentoos are the largest", color= "red", fontface="bold", size=4.5, angle=25)

#PARTE DEL TEXTO COMO VARIABLE
p <- ggplot(data=penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color=species)) +
  labs(title ="Palmer Penguis: Body Mass vs. Fliper Length")


p + annotate("text",x=220, y=3500, label = "Te Gentoos are the largest", color= "red", fontface="bold", size=4.5, angle=25)

#GUARDAR ARCHIVO

pdf(file = "/Users/Universidad/Documents/example.pdf",    
    width = 4,     
    height = 4) 
plot(x = 1:10,     
     y = 1:10)
abline(v = 0)
text(x = 0, y = 1, labels = "Random text")
dev.off()


ggplot(data = penguins) + 
  
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g)) + labs(title = "Pinguinos")

