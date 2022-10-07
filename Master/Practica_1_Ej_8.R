
library(tidyverse)
install.packages("car")
library(car)

#a)

alcohol <- c("N", "S", "S", "N", "S", "N", "N", "S", "S", "S")

alcoholFactor <- factor(recode(alcohol, "1=1;4=1;6:7=1;2:3=2;5=2;8:10=2"),
                         labels = c("No", "Sí"))

#b)

fuma <- c(0,1,0,1,0,0,0,1,1,1)
fumaFactor <- factor(recode(fuma, "0=1;1=2;3=1;4=2;5:7=1;8:10=2"),
                     labels = c("Fuma", "No fuma"))
