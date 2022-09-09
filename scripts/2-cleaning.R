####################################################
# Data cleaning
# author: Gustavo A. Castillo Alvarez
####################################################
# Prepare workspace ------------------------------------------------------------
rm(list = ls())

# Limpiar personas empleadas (dsi==0) y mayores de 18 (age>=18)-----------------
geih <- read_csv("../stores/encuesta.csv")
df <- geih %>% 
  filter(age>=18, dsi==0) #%>%
  #select(ingtotob, age, p6210, dsi, maxEducLevel,estrato1, sex)

# Limpiar missings---------------------------------------------------------------
is.na(df$ingtot) %>% table()
is.na(df$y_gananciaIndep_m) %>% table()
is.na(df$y_total_m) %>% table()
is.na(df$age) %>% table() #7876 missings
 
# Eliminar missings
df_na <- df %>% filter(is.na(y_total_m)==FALSE)

# Reemplazar por media
df %>% select(directorio, y_total_m) %>% head()

arepa <- df %>%
  group_by(directorio) %>%
  mutate(mean_y_total_m=mean(y_total_m, na.rm=TRUE))

arepa %>% select(directorio, y_total_m, mean_y_total_m) %>% head()

df_na_mean <- df %>% 

# Reemplazar por mediana

# Descriptive analysis ---------------------------------------------------------
skimr::skim(df$y_gananciaIndep_m)
