library(tidyverse)

#Vamos a ordenar los niveles. Creamos una lista con los meses válida
x1 <- c("Dec", "Apr", "Jan", "Mar")
month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)
#Creamos el factor e imprime x1
y1 <- factor(x1, levels = month_levels)
y1
#Y ordenamos x1, con el factor como patron de ordenación
sort(y1)

#Cualquier valor que esté equivocado lo representará con NA
x2 <- c("Dec", "Apl", "Jam", "Mar")
y2 <- factor(x2, levels = month_levels)
y2

#Trabajamos con la encuesta gss_cat
View(gss_cat)

gss_cat %>%
  count(race)
#elimina en la escala los valores sin valor
ggplot(gss_cat, aes(race)) +
  geom_bar()

#Aquí obligamos que nos lo muestre
ggplot(gss_cat, aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)

#cantidad promedio de horas que pasan viendo televisión 
#por día en todas las religiones
relig_summary <- gss_cat %>%
  group_by(relig) %>%
  summarise(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )
relig_summary

ggplot(relig_summary, aes(tvhours, relig)) + 
  geom_point()

#Ordenamos los factores para que haya un patrón
ggplot(relig_summary, aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()

#-------------GRAFICOS DE LINEAS Y LEYENDAS--------------------
by_age <- gss_cat %>%
  filter(!is.na(age)) %>%
  count(age, marital) %>%
  group_by(age) %>%
  mutate(prop = n / sum(n))

#Un gráfico de líneas
ggplot(by_age, aes(age, prop, colour = marital)) +
  geom_line(na.rm = TRUE)

#Aquí el color de la línea se alinea con la leyenda
ggplot(by_age, aes(age, prop, colour = fct_reorder2(marital, age, prop))) +
  geom_line() +
  labs(colour = "marital")

#---------------------------------------------------------------
#Para ordenar graficos por leyendas con fct_infreq() y fct_rev())
gss_cat %>%
  mutate(marital = marital %>% fct_infreq() %>% fct_rev()) %>%
  ggplot(aes(marital)) +
  geom_bar()

#----Modificar los niveles de los factores----------------------
gss_cat %>% count(partyid)

#Modificamos los valores en más consistentes
gss_cat %>%
  mutate(partyid = fct_recode(partyid,
                              "Republican, strong"    = "Strong republican",
                              "Republican, weak"      = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak"        = "Not str democrat",
                              "Democrat, strong"      = "Strong democrat"
  )) %>%
  count(partyid)

#Ordenamos y le indicamos con n cuantos grupos queremos mantener

gss_cat %>%
  mutate(relig = fct_lump(relig, n = 10)) %>%
  count(relig, sort = TRUE) %>%
  print(n = Inf)





























































