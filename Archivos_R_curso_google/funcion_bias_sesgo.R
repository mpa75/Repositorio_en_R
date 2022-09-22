

install.packages('SimDesign')
library(SimDesign)


#Si el número está lejos de 0 la información
#está muy sesgada. Proxima a 0 poco sesgada
actual_temp <- c(68.3, 70, 72, 71.4, 67, 70)
predict_temp <- c(67.9, 69, 71.5, 70, 71, 70.8)
bias(actual_temp, predict_temp)


#El resultado está muy lejos de 0.....
ventas_actuales <- c(150,203,137,247,116,287)
ventas_previstas <- c(200,300,150,250,150,300)
bias(ventas_actuales,ventas_previstas)

data("diamonds")
str(diamonds)
data("ToothGrowth")
head(ToothGrowth)