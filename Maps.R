setwd("C:/Users/alejandro.labarca/Desktop/Curso R")
#install.packages(sp)
library(sp)
library(ggplot2)
library(rgdal)
library(rgeos)
library(ggmap)
#Lectura de datos geolocalizados
VE<-readRDS("VEN_adm2.rds")
#Creación de una nueva columna de identificador "id"
VE@data$id<-rownames(VE@data)
#Transforma datos geolocalizados en un marco de datos
VE_temp<-fortify(VE,region="id")
#Identifica las filas comunes entre los datos geolocalizados y el marco de datos
VEN<-merge(VE_temp,VE@data,by="id")

###Creación de gráficos geolocalizados###

##2-D
ggVEN <- ggplot(data = VEN, aes(x=long, y=lat, group = group,
                                fill = NAME_2)) +
  geom_polygon()  +
  geom_path(color = "white") +
  scale_fill_hue(l = 40) +
  coord_equal() +
  theme(legend.position = "none", title = element_blank(),
        axis.text = element_blank())

print(ggVEN)

##Google Maps

Transform <- spTransform (VE, CRS("+proj=longlat"))

# determinar el cuadro delimitador del objeto espacial
b <- bbox (Transform)

# obtener y trazar un mapa
area <- ggmap (get_map(location = b,maptype = "satellite", zoom = 6))

TransformFortified <- fortify (Transform, region = "id")
TransformFortified <- merge (TransformFortified,
                            Transform@data, by.x = "id")

area + geom_polygon (data = TransformFortified,
                                aes (x = long, y = lat, group = group,
                                     fill = NAME_2), alpha = 0.65) +
  scale_x_continuous (limits = c (b [1,1], b [1,2])) +
  scale_y_continuous (limits = c (b [2,1], b [2,2])) +
  theme (legend.position = "none", title = element_blank ())


