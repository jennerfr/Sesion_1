########################################################################
########################    SESIÓN 1. BEDU      ########################
########################      Objetos en R      ########################
########################################################################


####   EJEMPLO 1
#Tipos de datos y Vectores

var.hola <- "Hola Mundo"
var.number <- 5
var.double <- 2.7076
var.logical <- T
vector <- c(1,2)

class(var.number)
class(var.hola)
class(var.double)
class(var.logical)

typeof(vector)
typeof(var.number)

# Crear vectores 
a <- c(4, 6, 8, 10,12)
b <- c(3, 5, 7, 9)

# Para saber la dimensión del vector 
length(a)
length(b)

#Se puede acceder a las coordenadas de un vector haciendo uso de [] y su posición
a[1]
b[4]

# Juntar 2 vectores 
c(a,b)

# Organizarlos con el comando sort(), cambia la F por T y observa que ocurre
sort( c(a,b), decreasing = F)

# Otra forma de generar el vector es de la siguiente manera, utilizando ":"
3:12  #así de sencillo es

# Intenta los siguientes y prueba con otras que se te vengan a la imaginación
10:1
1:1000
0:10


# También se pueden generar vectores que no sean sucesivos con el comando seq()
#intenta cambiar los parametros y observa el comportamiento de los vectores
vector.by2 <- seq(from = 1, to = 10, by =2)
vector.by2

vector.by3 <- seq(1, 10, 3)
vector.by3

#Para repetir un número o un vector un determinado número de ocasiones utilizamos rep()
rep(5, times = 6)

rep(a, 2)
rep(b, 3)


#Reciclaje, al hacer operaciones entre vectores, R repetirá los valores del vector, 
# hasta alcanzar la dimensión requerida
c(1, 2) + c(7, 8, 9, 10)

#Operaciones entre vectores
a + b     
a - b     
a*b
a/b
a^2
a1 <- a*0.5 + b^2
a1[1]


####      EJEMPLO 2. Matrices
# Crear Matrices. Como se lee -> m[fila, columna]
m <- matrix(1:9, nrow = 3, ncol = 3)
m

#Extrayendo la primera entrada
m[1,1]

# Extrayendo la primer columna, con todas sus filas
m[ ,1]

# ¿Qué sucede si se suma un vector y una matriz?
sum.vecmat <- c(1,2) + m

# Creando otra matriz

n <- matrix(2:7, 4, 6)

# Podemos conocer la dimensión de la matriz así 
dim(n)

#Extrayendo subconjuntos de la matriz
n[n > 4]

# Ahora veremos como localizar la posición de las entradas anteriores
which(n > 4)


# Uniendo Vectores para formar una matriz

a <- 2:6
b <- 5:9

# Construyendo la matriz utilizando el comando cbind(), para unirlos por culumna
cbind(a,b)

# Construyendo la matriz utilizando el comando rbind(), para unirlos por fila
rbind(a,b)

#Aplicando una función a una fila o columna de una matriz 
apply(n, 2, mean)

apply(n, 2, sort)

# Algunas operaciones básicas de matrices 
# Producto matricial: A %*% B
# Producto elemento a elemento: A*B
# Traspuesta: t(A)
# Determinante: det(A)
# Extraer la diagonal: diag(A)
# Resolver un sistema de ecuaciones lineales (\( Ax=b \)): solve(A,b)
# Inversa: solve(A)
# Autovalores y autovectores: eigen(A)


##### Ejemplo 3. Listas y data frames
#Listas 
milista <- list(nombre = "Pepe", no.hijos = 3, edades.hijos = c(4, 7, 9))

#propiedades de la lista
str(milista)

#Extrayendo elementos de la lista
milista$nombre


#DATA FRAMES

x <- 6:8
y <- c("A", "B", "C")
mifile <- data.frame(edad = x, grupo = y)
mifile

str(mifile)

#Extrayendo información del df, se hace igual que con las matrices
mifile[1]
mifile[,1]
mifile$edad

#Calculando algunos estadísticos básicos
mean(mifile$edad)

# Podemos hacer uso de la función paste() para agregar un mensaje
paste("La media de la edad es:", mean(mifile$edad))

# Podemos inspeccionar a detalle el df utilizando summary()
summary(mifile)

# También se puede conocer su dimensión 
dim(mifile)

#Podemos agregar una columna extra con datos 
mifile$sexo <- c("H", "M", "H")
mifile

# Si fuera el caso, se puede eliminar una columna 
mifile$sexo <- NULL
mifile

##### Ejemplo 4. Descarga y lectura de DataSets.
# Se pueden obtener diversos data sets de Kaggle, visita el sitio para que te familiarices
# La siguiente es ua base de datos de los libros más vendidos en Amazon del 2009 - 2019

#Obtenemos la ruta del directorio de trabajo
getwd()

#Fijando el directorio de trabajo
setwd("c:/Users/User/Documents/Bedu/")

# El comando read.csv() será util para leer fichero .csv
read.csv("../Bedu/Data/bestsellers with categories.csv")

#se puede asignar a un objeto el fichero leido anteriormente
amazon.books <- read.csv("../Bedu/Data/bestsellers with categories.csv")

# Calculamos la dimensión de la base de datos
dim(amazon.books)

# El tipo de objeto se puede saber utilizando class() 
class(amazon.books)


#### Ejemplo 5. Instalar packages y leerlos, esto es útil ya qu agrega funcionalidades a
# R, ya sea para graficar o generar análisis con diversas técnicas.

# Se instalan de la siguiente manera
install.packages("ggplot2")    #siempre lleva  comillas

# Una vez que se instalo, se debe de cargar 
library(ggplot2)                # Se omite el uso de las comillas

# Otro ejemplo
install.packages("dplyr")
library(dplyr)

# También se puede realizar esta acción en la pestaña de Packages 


#### Ejemplo 6. Loops: For

w <- rnorm(20)              
print("Este loop calcula el cuadrado de los 10 primeros elementos del vector w")

# inicializando la varialbe `wsq`
wsq <- 0

for(i in 1:10) {
  # i-th element of `u1` squared into `i`-th position of `usq`
  wsq[i] <- w[i]**2
  print(wsq[i])
}
