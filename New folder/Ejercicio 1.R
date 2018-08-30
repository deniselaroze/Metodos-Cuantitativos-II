#################################
### Respuestas Guia Ejercicios 1
### 31/08/2018
#################################

library()

# 1) Bajar datos del banco mundial u otro organismo relevante para sus tema de investigación. Pueder ser útil utilizar el paquete "wbstats" y
# la función de más abajo o ir directamente a las páginas del banco mundial a buscar los datos

#Funciones que pueden ser útiles:
mydf <-  wb(indicator = c("Algo relevante"), 
            startdate = año, enddate = año)

mydf<-merge(df1, df2, by="id")

# 2) Transformar los datos en un data.frame que se pueda utilizar para hacer análisis estadísticos (país, año, indicadores hacia el lado)
#Funciones que pueden ser útiles:
dfw <- reshape(mydf[, list(
    country, region, date, value, indicator)], 
  v.names = "value", 
  idvar=c("date", "country", "region"), 
  timevar="indicator", direction = "wide")

# 3) Separar los datos en dos poblaciones de interés (teóricamente)

df$varname<-ifelse(condicion, valor.si, valor.otro)

# 4a) Hacer una prueba de t de una sola muestra

# 4b) Hacer una prueba de t de dos muestras (para eso separar los datos en dos grupos que sean teóricamente razonables)


# 5a) Calcular la covarianza entre dos variables de interés del DF que generaron

# 5b) Interpretar los resultados


# 6a) Calcular la correlación entre dos variables de interés del DF que generaron

# 6b) Interpretar los resultsdos


