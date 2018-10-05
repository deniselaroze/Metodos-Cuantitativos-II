####################################
### Curso Métodos Cuantitativos II
### 2018
### Profesora: Dr. Denise Laroze
### Tarea 2 - Respuestas
####################################
library(stargazer)


# 1) Generar dos variables independientes (no correlacionadas entre sí) con 1000 observaciones cada una
# y con la distribución que quieran. Además, generar
# una variable dependiente y un error que estén relacionados de acuerdo a la siguiente ecuación:
# Y = 5 + 0.1*X1 + 0.5*X2 + e. Con un e que tenga un sigma de 2.
# Fije el seed de la generación aleatoria de datos, para que los resultados sean reproducibles --Ej. set.seed(4523)
#  15 pts

# funciones útiles
set.seed(xxxx)
rnorm(n, media, sigma)
runif(n, min, max)

# 2) corra una regresión lineal e interprete los resultados. ¿Le hacen sentido? Interprete los resultados.

# funciones útiles:
lm(y ~ var1, var2)
summary(modelo)
# 10 pts


# Use stargazer() para exportar los resultados de su regressión. 
# Sugerencia: si usa word exporte a hmtl, copie y pegue cuadro. 
# sugerencia 2: Deje de usar word. ;) 
# 5 pts

# funciones útiles:
stargazer(modelo1, modelo2, etc. )

# 3) aumente el sigma de e a 15 y corra la misma regresión. Interprete. 
# 5 pts


# 4) Genere una dummy agreguela a la regresión e interprete. Vuelva a usar un e con sigma 2.  
# use la ecuación: Y = 5 + 0.1*X1 + 0.5*X2 + 1.5*X3 + e.
# 5 pts

# funciones útiles:
rbinom(n, tamaño, prob)


# 5) Genere los mismos datos, pero con 50 observaciones cada variable. Corra la regressión e interprete.
# 5 pts


# 6) Genere una nueva variable x4 que esté correlacionada con x2 y con Y. Corra una regressión del tipo
# lm(y ~ x1 + x2 ), otra lm(y ~ x1 + x2 + x4) y después otra lm(y ~ x2 + x4). Interprete. 
# Use los valores de beta que quiera

# 15 pts

cor.test(var2,var4)
stargazer(modelos)


# 7) Bonus question - Corra una regresión utilizando datos que a usted le interese e interprete. Agrega 10 pts.  
