#################################
### Respuestas Guia Ejercicios 1
### 31/08/2018
#################################

library(wbstats)

# 1) Bajar datos del banco mundial u otro organismo relevante para sus tema de investigación

mydf <-  wb(indicator = c("SP.POP.TOTL",
                          "SP.DYN.LE00.IN",
                          "SP.DYN.TFRT.IN",
                          "EN.ATM.CO2E.PC"), 
            startdate = 1990, enddate = 2010)



# 2) Transformar los datos en un data.frame que se pueda utilizar para hacer análisis estadísticos

countries <- wbcountries()

### Identificar a los países
countries<-countries[,c("iso3c", "region")]

### Merge ambas DF
mydf<-merge(mydf, countries, by="iso3c")


# Eliminar datos agregados
mydf <- mydf[!mydf$region %in% "Aggregates", ]
# Reshape data into a wide format


wdf <- reshape(
  mydf[, c(
    "country", "region", "date", "value", "indicator")], 
  v.names = "value", 
  idvar=c("date", "country", "region"), 
  timevar="indicator", direction = "wide")

names(wdf)<-c("country", "region", "date", "totpop", "lifeexpect", "fertility", "co2")

# 3) Separar los datos en dos poblaciones de interés (teóricamente)

table(wdf$region)

wdf$diffinterest<-ifelse(wdf$region=="Latin America & Caribbean ", 1, 0)

table(wdf$region, wdf$diffinterest)

# 4a) Hacer una prueba de t de una sola muestra

# 4b) Hacer una prueba de t de dos muestras (para eso separar los datos en dos grupos que sean teóricamente razonables)


# 5a) Calcular la covarianza entre dos variables de interés del DF que generaron

# 5b) Interpretar los resultados


# 6a) Calcular la correlación entre dos variables de interés del DF que generaron

# 6b) Interpretar los resultsdos


