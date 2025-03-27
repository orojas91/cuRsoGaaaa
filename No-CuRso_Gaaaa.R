##############################
######## No Curso R ##########
##### Omar Rojas-Padilla #####
#### projasomar@gmail.com ####
## GAAAAAAAAAAAAAAAAAAAAAAA ##
##############################

####################################### Dia 01 ########################################

#1. Exploración de la interfaz de RStudio.
#2. Tools -> Global Options -> Appearance

# Cosas importantes del R:
## 1. los códigos en R son sensibles a los caracteres: "A" es diferente que "a"
## 2. "Warnings" no son "Errors": si aparece un "warning" tu código puede que funcione, 
##    si hay un "error", no.
## 3. Es probable que los archivos "csv" estén delimitados por ";" y no por ",". Verificar eso.
## 4. Puedes "rodar" el script con "Ctrl + R" o click en "Run"

# el "#" significa que es una anotación o comentario, todo lo que esté después del "#"
# no será leído por R

## Algunos ejemplos: R como calculadora ##

1+1 #el resultado se muestra en la ventana de "console"
1 + 1 #¿sale igual?
sum(1+2) #¿y ahora mismo?
sqrt(144)
1 + 1 ¿y ahora

#¿Cuál es el problema?#

## Sintaxis del R:
# nombrefunción(paréntesis que tiene argumentos, detalles, elementos, entre otros)

## Crear vectores
#"Vector" es una combinación de "elementos", letras o números
#Un vector se crea con la función "c()" - "c" es "combinar", más o menos

c(1,2,3,4,5) #un vector de números
c("hola", "estamos", "en", "Trujillo", "gaaaa")

  #¿qué pasa si no colocamos las comas?#


#realiza el ejemplo anterior sin comas, pe.

## Crear objetos
#objeto es un "contenedor", puede ser de vectores, gráficos, entre otros
#es, básicamente, el resultado de una función pero almacenada. La sintaxis es:
# "nombre.objeto" "<-" "función(vector)"

vector1 <- c(1,2,3,4,5)
#¿Qué pasó?
vector 2 <- c(32,32,30,18,28)
#error? corregir
vector3 <- c("Patrick", "Omar", "Francis", "Pepe", "Joaquin")

  #Ejercicio: ¿Qué pasa si agregas otros valores al mismo objeto?#

##Combinemos vectores

vector1
vector2
vector3

#combinar en filas
rbind(vector1, vector2, vector3)

  ##¿qué falta para que esa información esté en un objeto?##

filas.combinadas <- rbind(vector1, vector2, vector3)
filas.combinadas

#combinar en columnas
columnas.combinadas <- cbind(vector1, vector2, vector3)
columnas.combinadas

##Ahora un data frame
#dataframe es la combinación de filas y columnas, algo así como un excel

as.data.frame(columnas.combinadas)
dataframe1 <- as.data.frame(columnas.combinadas)

#otra forma de hacerlo:
rbind(vector1, vector2, vector3)
dataframe2 <- rbind(vector1, vector2, vector3)

##Visualizar el dataframe
View(dataframe1)
head(dataframe1) ##esto solo mostrará las primeras 10 filas
dataframe1

##visualizar/extraer datos de columnas
#"$" permite seleccionar una columna dentro del dataframe
dataframe1$vector1
dataframe1$vector2
dataframe1$vector3  

##agregar una columna
dataframe1$unos <- 1
dataframe1

vector4 <- c(87,70,73,65,110)
dataframe1$vector4 <- vector4
  ##otra forma: dataframe1$vector4 <- c(87,70,73,65,110)
dataframe1

##cambiar nombre de las columnas
nombres <- c("id", "edad", "nombres", "laptops", "peso")
colnames(dataframe1) <- nombres
dataframe1

  ##¿otra forma?##
colnames(dataframe1) <- c("id", "edad", "nombres", "laptops", "peso")

  ###Es importante recordar que en R hay diferentes maneras de conseguir lo mismo###

  ##Ejercicio: agregar columna "sexo" y designar un género para nombre##

## realiza tu ejercicio pe causa


## ¿así quieres aprender?


## ahora suelta tu GAaaaaaaaaaaaaaaaaaa

##Identificando un elemeno específico
#Debemos tener en cuenta la estructura de fila y columna
#[1,3] primera fila, tercera columna

dataframe1[1,3]
dataframe1[2,] #solo fila 2
dataframe1[,5] #solo columna 5

dataframe1[c(2,3),] #todos los elementos de las filas 2 y 3
dataframe1[,c(3,5)] #todos los elementos de las columnas 3 y 5
dataframe1[c(1:4),] #elementos de las filas 1 al 4

  ##EJERCICIO: extraer columnas 1, 3 y 5; y guardarla en un objeto##

##Agregar un "NA" para complicar la cosa
dataframe1[3,5] <- NA
dataframe1 #¿qué pasó?

##ahora eliminar ese "NA"
na.dataframe1 <- na.omit(dataframe1)
na.dataframe1 #¿y ahora? #¿se dieron cuenta que cambiamos el nombre del objeto?

dataframe1[3,5] <- 73

dataframe1
na.dataframe1
  ##¿hay diferencias?

##Visualizar estructura del dataframe
str(dataframe1) #¿hay algo raro?

##Convertir "characters" a "numérico"
dataframe1$edad <- as.numeric(dataframe1$edad)
str(dataframe1) #verificar

##Análisis y gráficos simples de nuestro dataframe1
mean(dataframe1$peso)
summary(dataframe1$peso)
hist(dataframe1$peso)
boxplot(dataframe1$peso, dataframe1$edad)

#####################################################################
##Compliquemos las cosas y manipulemos una base de datos más grande##
#####################################################################

## algunos comandos interesantes:
options(scipen=100) ## para connotación científica

#R tiene dataframe con datos en su memoria interna, usemos uno llamado "iris" para nuestro 
# ejercicio de manipulación de datos

iris
head(iris)

#150 filas con cinco columnas
#columnas: Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species

#ver rápidamente la estructura de la base de datos
str(iris)

#extraer datos de la especie "setosa"
setosa.data <- iris[iris$Species == "setosa",]

#extraer columnas "Sepal.Length" y "Sepal.Width"
iris[,c(1,2)]
iris.subset <- iris[,c(1,2)]
head(iris.subset)

  ##Ejercicio: extraer datos de "setosa" y "versicolor" y guardarlo en un objeto

  ##Ejercicio: extraer las filas que contengan el valor 3.9 de la columna "Sepal.Width"
    ##¿cuántos registros existen?, ¿a cuál(es) especies pertenece estos registros

####################################### dplyr ########################################

#Paquete "dplyr"
#Paquetes son "complementos" al R. Son desarrollados por programadores/investigadores para
#añadir funcionalidades (o mejorar las existentes) del lenguaje. Hay paquetes para todo:
#análisis GIS, modelos de nicho ecológico, análisis ecológicos, gráficos, manipulación de datos, etc
#paquetes para todo, en serio: colores de pokemon, personajes de star wars, películas, etc

#instalaremos el paquete "dplyr"
install.packages("dplyr")

#llamaremos al paquete
library(dplyr)

#data de Star Wars:
starwars
View(starwars) #analicemos la información presente en la base de datos

#Filtremos los datos asociados a la especie "Human"
starwars %>%
  filter(species == "Human")

human.starwars <- 
  starwars %>%
  filter(species == "Human")

#Agrupar por name
starwars %>%
  group_by(name)

#seleccionar columnas que poseen un patrón
starwars %>%
  select(name, ends_with("color"))

#hacer cálculos entre columnas
#calcular el índice de "tejido" corporal con la siguiente fórmula
# teji.corp = masa / ((peso/100)^2)
# columnas masa y peso
starwars %>%
  mutate(name, teji.corp = mass / ((height / 100)  ^ 2)) %>%
  select(name:mass, teji.corp)

#ordenar de mayor a menor una columna
starwars %>%
  arrange(desc(height))

#resumen estadísticos
# Agrupar por especie, extraer "n" de cada especie y la masa
starwars %>%
  group_by(species) %>%
  summarise(
    n = n(),
    mass = mean(mass, na.rm = TRUE)
  ) %>%
  filter(
    n > 1,
    mass > 50
  )

## Ejercicios extraídos de: https://dplyr.tidyverse.org/ ##

#aplicar dplyr con "iris"
head(iris)

##Ejercicios

#1. Extraer datos de la especie "versicolor"
#2. Extraer columnas "Sepal.Width" y "Petal.Length"
#3. Agrupar y resumen de datos: Especie | media sepal length | media sepal width
#4. Ordenar de mayor a menor "Sepal.Width"
#5. Calcular el ratio de "sepal" con la fórmula Sepal.Length / Sepal.Width

####################################### Respuestas ########################################
#1
iris.versicolor <- filter(iris, Species == "versicolor")
head(iris.versicolor)

#2
iris_subset <- select(iris, Sepal.Length, Sepal.Width)
head(iris_subset)

#3
iris_summary <- iris %>%
  group_by(Species) %>%
  summarise(mean_sepal_length = mean(Sepal.Length),
            mean_sepal_width = mean(Sepal.Width))
iris_summary

#4
iris_sorted <- arrange(iris, desc(Sepal.Length))
head(iris_sorted)

#5
iris_with_ratio <- mutate(iris, sepal_ratio = Sepal.Length / Sepal.Width)
head(iris_with_ratio)




####################################### Dia 02 ########################################

#Ahora vamos a hacer algunos análisis y gráficos exploratorios con la base de datos "iris"

head(iris)
  ##recuerda mirar la estructura para continuar
str(iris)

# Hacer un "summary" de cada variable: 
# esta función muestra datos como media, mediana, cuartiles y valores máximos y mínimos
summary(iris[, 1:4])

# Pero de esta manera solo se ve el resumen estadístico por varible y no por especie

# Haremos un subset de los datos de "setosa"
setosa.data <- subset(iris, Species == "setosa")
summary(setosa.data)

### Histogramas ###

# ahora un histograma de la variable Sepal.Length de "setosa"
hist(setosa.data$Sepal.Length)
## Interpretar el gráfico con la gente:
## leer cada eje
## las barras
## ¿qué tipo de distribución tiene este histograma?
## ¿existen valores atípicos?

# hagamos el gráfico más simpático más "aesthetic"
# cada función tiene una serie de argumentos para agregar detalles al análisis o al gráfico,
# para acceder a esto debemos usar la función "ayuda" "?", se ejecuta de esta manera
# ?(nombredelafuncion)

?hist

# ahora agreguemos algunos argumentos a la función hist

hist(setosa.data$Sepal.Length, 
     #labels = TRUE, # agregar números en las barras
     main = "Histograma de la Longitud del Sépalo de 'Setosa'", #título del gráfico
     xlab = "Longitud de sépalos", #título del eje x
     ylab = "Frecuencia", #título del eje y
     col = "lightblue", #color de las barras
     border = "red", #color de los bordes
     )

hist(setosa.data$Sepal.Width, 
     #labels = TRUE, # agregar números en las barras
     main = "Histograma del ancho del Sépalo de 'Setosa'", #título del gráfico
     xlab = "Ancho de sépalos", #título del eje x
     ylab = "Frecuencia", #título del eje y
     col = "lightblue", #color de las barras
     border = "red", #color de los bordes
)

#hist# ahora vamos a plotear dos gráficos en una sola figura... y exportarla

# primero dividir el gráfico con "mfrow"
par(mfrow=c(1,2)) #una fila y dos columnas

hist(setosa.data$Sepal.Length, 
     #labels = TRUE, # agregar números en las barras
     main = "Histograma de la Longitud del Sépalo de 'Setosa'", #título del gráfico
     xlab = "Longitud de sépalos", #título del eje x
     ylab = "Frecuencia", #título del eje y
     col = "lightblue", #color de las barras
     border = "red", #color de los bordes
)

hist(setosa.data$Sepal.Width, 
     #labels = TRUE, # agregar números en las barras
     main = "Histograma del ancho del Sépalo de 'Setosa'", #título del gráfico
     xlab = "Ancho de sépalos", #título del eje x
     ylab = "Frecuencia", #título del eje y
     col = "lightblue", #color de las barras
     border = "red", #color de los bordes
)

par(mfrow=c(1,1))

  #Ejercicio: hacer histograma para todas las varibles de "versicolor" y plotear los cuatro
  #gráficos en una sola figura

## ¿Para qué es importante ver la distribución de los datos?
## ¿recuerdan lo de distribución "normal" o "paramétrica" y "no normal" "no paramétrica"

### Distribución de datos: normal o no-normal(?) ###

## Distribución normal: ##
## la mayoría de datos se concentran cerca de la media y están dispersos uniformemente en ambas 
## direcciones

## ¿por qué se busca una distribución normal?
## - Modelamiento de fenómenos: mayoría de fenómenos naturales siguen una distribución normal
##    como el peso, altura de personas, errores de medición, entre otros.
## - Inferencia estadística: es requisito para pruebas estadísticas [sin embargo, hay
##    alternativas "no paramétricas"].
## - Entre otras vainas...

## Entonces a verificar la normalidad de los datos

## Para esto usaremos la función "shapiro.test" que ejecuta el test de normalidad "Shapiro-Wilk"
## nuestras hipótesis
## H = datos no poseen una distribución normal | p < 0.05
## H0 = datos poseen una distribución normal | p > 0.05

shapiro.test(setosa.data$Sepal.Length)
# p-value = 0.4595
# p > 0.05 --> 0.4595
# --> No se rechaza la hipótesis nula, o sea, los datos poseen una distribución ...

## también podemos agregar una línea de la distribución normal teórica al histograma
## primero debemos crear una función para la distribución normal teórica
## esta función está definida por el promedio y la desviación estandar de los datos

curv.dist <- function(x)  dnorm(x, mean = mean(setosa.data$Sepal.Length), 
        sd = sd(setosa.data$Sepal.Length))

## plotearlo en el histograma
hist(setosa.data$Sepal.Length)
curve(curv.dist, col = "blue", add = TRUE,
      from = min(setosa.data$Sepal.Length),
      to = max(setosa.data$Sepal.Length))

### Cuartil-Cuartil ###

## otro gráfico útil es el de "normalidad", para hacerlo
## usaremos la función "qqnorm" del paquete "stats"

library("stats") ## llamar paquete
qqnorm(setosa.data$Sepal.Length)
  ## interpretar el gráfico juntos
  ## el gráfico es llamado de Q-Q: Quantile - Quantile (Cuartiles - Cuartiles)
  ## muestra la distribución en cuantiles de los datos observados y teóricos
  ## eje x = datos observados | eje y = datos teóricos
  ## si los datos son presentados como una "diagonal" sugiere una distribución es normal

qqline(setosa.data$Sepal.Length, col = 2)
  ## es una línea de referencia
  ## representa la relación entre los cuantiles observados y teóricos

## ¿Cómo se vería una distribución "no normal"?
## Simular datos con distribución no paramétrica con "runif"
x.anormal <- runif(100, min = 2, max = 4)
hist(x.anormal)

shapiro.test(x.anormal) #p-value > 0.05
qqnorm(x.anormal)
qqline(x.anormal)

  ## Ejercicio: agregar la curva de normalidad al histograma de los datos con distribución no-normal

### Gráficos de dispersión ###

## Es un gráfico simple que muestra como nuestros datos están dispersos en un plano cartesiano
## los ejes son las variables que nosotros decidamos comparar

plot(iris)

plot(iris$Sepal.Length)

plot(iris$Sepal.Length ~ iris$Sepal.Width)

### Boxplots ###

## También conocidos como gráficos de "bigotes". Sirve para visualizar la distribución
## de datos, pero OJO: no siempre permite descartar una distribución no paramétrica. Lo que sí
## permite, es identificar datos atípicos (i.e., outlier) de una manera rápida y eficaz.

## vamos a hacer el gráfico y menos bla bla bla
boxplot(setosa.data)
## ¿qué es esa wea?
## la rayita negra es la media o mediana?... seguro?
## estos datos son por especie o por variable?

## Ahora un boxplot de una sola variable
boxplot(setosa.data$Sepal.Length)

## Para entender mejor el boxplot
boxplot(setosa.data$Sepal.Length)
## agregar puntos que representan los datos muestreados
points(jitter(as.numeric(setosa.data$Species), factor = 13), 
       setosa.data$Sepal.Length, col = "blue", pch = 16)
## si desean pueden modificar el valor de "factor" para ver qué pasa

## ¿eso no más? y el título del gráfico y los ejes?
  ## ese es el ejercicio

## Los boxplot son más informativos cuando comparados con otros boxplot. Por ejemplo,
## grafiquemos el Sepal.Lenght de cada especie:
boxplot(iris$Sepal.Length ~ iris$Species, data = iris)
## interpretar juntos

## Recordemos que la línea central es la mediana. Ahora agreguemos la media (o promedio)
## Calculemos la media
promedios <- aggregate(Sepal.Length ~ Species, data = iris, FUN = mean)

## Ahora ponerlo en el gráfico
boxplot(iris$Sepal.Length ~ iris$Species, data = iris)
points(promedios$Species, promedios$Sepal.Length, col = "red", pch = 16)

## Debido a que el promedio y la mediana no presentan muchas diferencias estos datos están
## cuasi solapados

  ## Ejercicio: hacer un boxplot del Petal.Length categorizado por especie
  ##  No olvides calcular el promedio y plotearlo en el gráfico
  ##  Usa otros argumentos de la función "boxplot" para hacer un gráfico aesthetic

### Correlación de variables ###

## probablemente sea uno de los conceptos estadísticos más conocidos, la correlación
## no es más que la relación existente entre dos variables. Entender el comportamiento de una
## con respecto a la otra, o algo así.

## mucho bla bla, ahora la práctica

## Relacionaremos las variables $Sepal.Length y Petal.Length de setosa.data
setosa.data
## ¿no lo tienes?, recuerda que puedes extraerlo del data frame iris
  #setosa.data <- iris[iris$Species == "setosa",]

## ¿cuál es nuestra hipótesis?
## H1 = existe una correlación entre las variables | p < 0.05
## H2 = no existe una correlación entre las variables | p > 0.05

## calcular el coeficiente de correlación entre las variables con la función "cor"

cor.test(setosa.data$Sepal.Length, setosa.data$Petal.Length)
## podemos extraer las estadísticas: 
  ## r (cor) = 0.2671758 | Fuerza y dirección de la correlación 
  ## p = 0.0607 | significancia estadística de esta correlación
  ## R2 = ¿on tá! | porcentaje de la variación de una variable explicada por la otra

## calcular el R2
0.2671758^2 # R2 =0.07138291

## calma, calma, ¿cómo se come esta vaina?

## vans a hacer el gráfico
plot(setosa.data$Sepal.Length, setosa.data$Petal.Length,
     pch = 16) #gráfico dispersión entre ¿cuáles variables?
  ## explora el argumento pch

## ahora ponerle una línea pa' entender "más" mejor
abline(lm(setosa.data$Petal.Length ~ setosa.data$Sepal.Length), col = "red")

## vamos a agregar las estadísticas, peero
## primero guardaremos los resultados en objetos
r <- cor(setosa.data$Sepal.Length, setosa.data$Petal.Length)
p <- cor.test(setosa.data$Sepal.Length, setosa.data$Petal.Length)
R2 <- r^2

## ahora sí agregar los datos al gráfico
text(4.5,1, paste("r =", round(r,2)), col = "blue")
text(5,1, paste("p =", signif(p$p.value, digits = 2)), col = "blue")
text(5.5,1, paste("R2 =", round(r2*100, 2)), col = "blue")

  ## Ejercicio: hacer la correlación entre $Petal.Width y $Petal.Length de "versicolor"
  ## ¡tendrás que hacer un subset de versicolor!!!
  ## tienes que presentar un gráfico aesthetic con título principal y de los ejes, las estadísticas y de triángulos

## vamos a complicar las cosas
## haremos una matrix de correlación, o sea, haremos la correlación para todas las variables
## y haremos un gráfico bieen aesthetic

## vamos a correlacionar las cuatro variables numéricas de iris
cor(iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")])

## pera nos estamos olvidando de algo
## guardar los resultados en un objeto, pe'
correlacion.matrix <- cor(iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")])

## para graficar vamos a usar la función "corrplot" del paquete del mismo nombre
## necesitamos instalar el paquete
install.packages("corrplot")
## ahora necesitamos abrir el paquete
library(corrplot)

## ahora sí, podemos hacer nuestro gráfico aesthetic
corrplot(correlacion.matrix, 
         method = "color", 
         type = "upper", 
         order = "hclust", 
         tl.col = "black", 
         tl.srt = 45)

correlation_matrix

## llegaste hasta aquí?
## el curso continuará
## algún día
## mientras eso...
## explora YouTube!!