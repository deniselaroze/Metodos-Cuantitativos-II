

library("margins")
library(stargazer)

#https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html
#https://cran.r-project.org/web/packages/margins/vignettes/Introduction.html



# Resumen de la base de datos
stargazer(mtcars, type="html", out="summary.html")


# Proporción lineal
x <- lm(am ~ cyl + hp + wt  + factor(gear), data = mtcars)
summary(x)
m <- margins(x)
summary(m)

# Máxima verosimilitud MLE

x2 <- glm(factor(am)~ cyl + hp + wt + factor(gear) , data = mtcars, family = binomial)
## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
summary(x2)

x3 <- glm(factor(am)~ cyl + hp + wt , data = mtcars, family = binomial)
## Warning: glm.fit: fitted probabilities numerically 0 or 1 occurred
summary(x3)


m1<-margins(x3, type = "response")
summary(m1)

m2<-margins(x3,  at = list(hp=c(66, 110, 150)), type = "response")
summary(m2)       



### Graficar
cplot(x3, "hp", what = "prediction", main = "Predicted Manual steering, given horsepower")
cplot(x3, "cyl", what = "prediction", main = "Predicted Manual steering, given number of cylinders")


