install.packages('Tmisc')
library(Tmisc)
data("quartet")
View(quartet)


#Media u desvizción estandar para 'x' y para 'y'. También 
#correlación entre las dos variables
quartet %>%
  group_by(set) %>%
  summarise(mean(x), sd(x), mean(y), sd(y), cor(x,y))

#gráficos de las dos variables, incompleta
ggplot(quartet,aes(x,y)) + geom_point() + geom_smooth(method=lm, se=FALSE) + facet_wrap(-set)
#incompleta                                                     
install.packages('datasauRus')
library(datasauRus)
ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset)) + geom_point() + theme_void()+theme((legend.position="none"))