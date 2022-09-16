

#Vamos a reducir argumentos en las llamadas
ggplot(data = faithful, mapping = aes(x = eruptions)) + 
  geom_freqpoly(binwidth = 0.25)


ggplot(faithful, aes(eruptions)) + 
  geom_freqpoly(binwidth = 0.25)


diamonds %>% 
  count(cut, clarity) %>% 
  ggplot(aes(clarity, cut, fill = n)) + 
  geom_tile()