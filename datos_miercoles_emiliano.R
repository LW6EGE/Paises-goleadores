
# Graficando los 10 mayores paises goleadores

library (tidyverse)
library(ggplot2)


 #install.packages("readr")

partidos_fifa_copa_mundial_procesado <- readr::read_delim("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-10/partidos.txt",delim = "\t")

 View (partidos_fifa_copa_mundial_procesado)

  goles_1= data.frame(partidos_fifa_copa_mundial_procesado$equipo_1, partidos_fifa_copa_mundial_procesado$equipo_1_final)

  goles_2= data.frame(partidos_fifa_copa_mundial_procesado$equipo_2, partidos_fifa_copa_mundial_procesado$equipo_2_final)

   
variables = c ("equipo" , "goles") #nombre de las variables que me interesa extraer

colnames(goles_1)= variables
colnames(goles_2)= variables
 


goles= bind_rows(goles_1, goles_2) #columnas

total_pais = aggregate(goles$goles~ goles$equipo, FUN=sum) #agrega todos los goles por columna 


top_10 = total_pais[order(total_pais$`goles$goles`, decreasing = T),] #ordeno por goles
top_10= top_10 [1:10,] #extrayendo los 10 mayores valores

colnames(top_10)=variables
p= ggplot (data=top_10, aes(equipo , y=top_10$goles, fill=top_10$equipo))+ xlab("Goles")+ ylab("Países") +geom_bar( stat = "identity" ) #grafica en horizontal,

p+ guides(fill=FALSE) + coord_flip() + ggtitle("Mayores paises goleadores") # sin referencias , con titulo y en horizontal


#gracias por leer el codigo. cualquier cosa puedes escrbirme a emiliano.gutierrez@uns.edu.ar
