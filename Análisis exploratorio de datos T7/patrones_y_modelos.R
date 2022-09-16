
#gráfico de dispersión de la duración de las erupciones de 
#Old Faithful frente al tiempo de espera entre erupciones 
#muestra un patrón: los tiempos de espera más largos 
#se asocian con erupciones más largas

ggplot(data = faithful) + 
  geom_point(mapping = aes(x = eruptions, y = waiting))

#>Los patrones proporcionan una de las herramientas más útiles 
#>para los científicos de datos porque revelan la covariación