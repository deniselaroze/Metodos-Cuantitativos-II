#################################
### Respuestas Guia Ejercicios 1
### 31/08/2018
#################################

library(wbstats)
library(Hmisc)
library(car)

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


wdf$dummy<-0
wdf$dummy[wdf$region=="Latin America & Caribbean "]<-1
table(wdf$diffinterest, wdf$dummy)


# 4a) Hacer una prueba de t de una sola muestra

# t-test # hyp: La mitad de la población miente 
# One sample t test
t.test(wdf$lifeexpect, mu=50) 

t.test(wdf$lifeexpect[wdf$region=="Sub-Saharan Africa "], mu=53.7) 






# 4b) Hacer una prueba de t de dos muestras (para eso separar los datos en dos grupos que sean teóricamente razonables)

# T-est de dos grupos, donde y es numérico y x es binario
t.test(lifeexpect ~ dummy, data = wdf)

# Paired t test

a2000<-wdf$lifeexpect[wdf$date==2000]
a2005<-wdf$lifeexpect[wdf$date==2005]

mean(a2000, na.rm=T) # Con dado real
mean(a2005, na.rm=T) # Con dado digital
t.test(a2000, a2005, paired = TRUE) 


##### Otra prueba
# Chi-square Test

wdf$mtemprano<-ifelse(wdf$lifeexpect < 75, 1, 0)

chisq.test(wdf$mtemprano, wdf$region) # variables categóricas
chisq.test(wdf$mtemprano, wdf$dummy) # variables categóricas

mean(wdf$mtemprano, na.rm=T)
mean(wdf$mtemprano[wdf$dummy==1], na.rm=T)


table(wdf$mtemprano, wdf$dummy)
summary(table(wdf$mtemprano, wdf$dummy)) #Chisq


table(wdf$mtemprano, wdf$region)
summary(table(wdf$mtemprano, wdf$region)) #Chisq


# 5a) Calcular la covarianza entre dos variables de interés del DF que generaron

cov(wdf$lifeexpect, wdf$co2, use = "complete.obs")

# 5b) Interpretar los resultados

### Hay una covariance positiva, donde países con más emiciones son tb los países con mayor expectativa de vida
### ¿Por qué? Tal vez porque los países más desarrollados tienen mayor producción de CO2 (USA por ejemplo) y 
### tb tiene expextativas de vida altos

# 6a) Calcular la correlación entre dos variables de interés del DF que generaron

cor(wdf$lifeexpect, wdf$co2, use = "complete.obs")
cor.test(wdf$lifeexpect, wdf$co2, use = "complete.obs") 

rcorr(wdf$lifeexpect, wdf$co2) 


scatterplot( co2 ~  lifeexpect, data = wdf, ylab="Expectativa de Vida", xlab="Emisiones CO2", col=carPalette()
             , regLine=list(method=lm, lty=1, lwd=2, col="Red"))


scatterplot( co2 ~  lifeexpect | region, data = wdf, ylab="Expectativa de Vida", xlab="Emisiones CO2", col=carPalette()
           , regLine=list(method=lm, lty=1, lwd=2, col="Red", by.groups=T))



# 6b) Interpretar los resultados


