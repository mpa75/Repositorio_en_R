penguins %>%
  select(-species)

penguins %>%
  rename(island_new = island)


penguins%>%
  arrange(bill_length_mm)
  
#Canalizacion paraValor máximo y medio de los picos de los pinguinos agrupados por especies y islas
penguins %>% group_by(species) %>% drop_na() %>%
  summarize(max_la = min(bill_depth_mm))

#filtrar

penguins %>%
  filter(species == "Adelie")
penguins %>%
  arrange(bill_length_mm)