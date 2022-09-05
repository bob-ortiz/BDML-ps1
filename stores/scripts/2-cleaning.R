# Limpieza de datos
## Limpiar personas empleadas (dsi==0) y mayores de 18 (age>=18)
df <- read_csv("../stores/encuesta.csv")
df <- geih %>% 
  filter(age>=18, dsi==0) %>%
  select(ingtotob, age, p6210, dsi, maxEducLevel,estrato1, sex)
