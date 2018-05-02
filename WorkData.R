###Importar datos###
rm(area,b,ggVEN,Transform,TransformFortified,VE,VE_temp)

###Dirección url

URL <- "http://www.ine.gov.ve/documentos/Demografia/CensodePoblacionyVivienda/xls/CuadrosResumenCenso2011/NacionalEntidades/Poblacion_Sexo_Censo_2011.xlsx"


##Descarga de datos

download.file(URL, "Genero.xlsx", mode = "wb")

#install.package("readxl")

library(readxl)#lectura archivos excel

Genero <- read_excel("Género.xlsx", col_names = TRUE)
#VEN["total_poblacion"]<-0
#VEN["hombres"]<-0
#VEN["mujeres"]<-0
#NIVEL_1=as.character(levels(as.factor(VEN$ID_1)))
#loop1=length(NIVEL_1)
#j=1
#i=1
#while(j<loop1+1){
 # NIVEL_2=as.character(levels(as.factor(VEN[VEN$ID_1==NIVEL_1[j],]$NAME_2)))
  #loop2=length(NIVEL_2)
  #while(i<loop2+1){
   # if(length(unique(Genero[grepl(NIVEL_2[i],Genero$Municipio) & Genero$ID_INE_1==NIVEL_1[j],]$ID_INE_2))==1){
    #  VEN[VEN$NAME_2==NIVEL_2[i] & VEN$ID_1==NIVEL_1[j],]$total_poblacion<-sum(Genero[grepl(NIVEL_2[i],Genero$Municipio) & Genero$ID_INE_1==NIVEL_1[j],]$Total)
     # VEN[VEN$NAME_2==NIVEL_2[i] & VEN$ID_1==NIVEL_1[j],]$hombres<-sum(Genero[grepl(NIVEL_2[i],Genero$Municipio) & Genero$ID_INE_1==NIVEL_1[j],]$Hombre)
      #VEN[VEN$NAME_2==NIVEL_2[i] & VEN$ID_1==NIVEL_1[j],]$mujeres<-sum(Genero[grepl(NIVEL_2[i],Genero$Municipio) & Genero$ID_INE_1==NIVEL_1[j],]$Mujer)
    #}
    #print(i)
    #i=i+1
  #}
  #print(j)
  #j=j+1
  #i=1
#}
#VALIDAR<-VEN[VEN$total_poblacion==0,]
#valida_municipio=as.character(levels(as.factor(VALIDAR$NAME_2)))
#VEN[VEN$NAME_2=="Andrés Bello" & VEN$NAME_1=="Táchira",c(23:25)]<-c(20358,9919,10439)
#VEN[VEN$NAME_2=="Andres Eloy Blanco" & VEN$NAME_1=="Barinas",c(23:25)]<-c(16144,8816,7328)
#VEN[VEN$NAME_2=="Antonio Diaz" & VEN$NAME_1=="Delta Amacuro",c(23:25)]<-c(26655,13982,12673)
#VEN[VEN$NAME_2=="Antonio Rómulo Costa" & VEN$NAME_1=="Táchira",c(23:25)]<-c(10061,5062,4999)
#VEN[VEN$NAME_2=="Carlos Arevalo" & VEN$NAME_1=="Carabobo",c(23:25)]<-c(150277,76297,73980)
#VEN[VEN$NAME_2=="Dependencias Federales" & VEN$NAME_1=="Dependencias Federales",c(23:25)]<-c(2155,1212,943)
#VEN[VEN$NAME_2=="Los Tanques" & VEN$NAME_1=="Falcón",c(23:25)]<-c(41579,20681,20898)
#VEN[VEN$NAME_2=="Palma Sola" & VEN$NAME_1=="Falcón",c(23:25)]<-c(7077,3640,3437)
#VEN[VEN$NAME_2=="Ortíz" & VEN$NAME_1=="Guárico",c(23:25)]<-c(23755,12513,11242)
#VEN[VEN$NAME_2=="Simón Planas" & VEN$NAME_1=="Lara",c(23:25)]<-c(35802,18593,17209)
#VEN[VEN$NAME_2=="Rivas Davila" & VEN$NAME_1=="Mérida",c(23:25)]<-c(20128,10266,9862)
#VEN[VEN$NAME_2=="Santa Barbara" & VEN$NAME_1=="Monagas",c(23:25)]<-c(9809,4982,4827)
#VEN[VEN$NAME_2=="Peninsula de Macanao" & VEN$NAME_1=="Nueva Esparta",c(23:25)]<-c(26423,13695,12728)
#VEN[VEN$NAME_2=="Isla de Coche" & VEN$NAME_1=="Nueva Esparta",c(23:25)]<-c(8985,4698,4287)
#VEN[VEN$NAME_2=="Guasimos" & VEN$NAME_1=="Táchira",c(23:25)]<-c(43236,21150,22086)
#VEN[VEN$NAME_2=="Jauregui" & VEN$NAME_1=="Táchira",c(23:25)]<-c(41000,20734,20266)
#VEN[VEN$NAME_2=="Samuel Dario Maldonado" & VEN$NAME_1=="Táchira",c(23:25)]<-c(17911,9200,8711)
#VEN[VEN$NAME_2=="Simón Rodriguez" & VEN$NAME_1=="Táchira",c(23:25)]<-c(2445,1275,1170)
#VEN[VEN$NAME_2=="José Felipe Márquez Cañizalez" & VEN$NAME_1=="Trujillo",c(23:25)]<-c(4551,2420,2131)
#VEN[VEN$NAME_2=="Juan Vicente Campos Elías" & VEN$NAME_1=="Trujillo",c(23:25)]<-c(5331,2723,2608)
#VEN[VEN$NAME_2=="Mara" & VEN$NAME_1=="Zulia",c(23:25)]<-c(207221,104689,102532)
#VEN[VEN$NAME_2=="Freites" & VEN$NAME_1=="Anzoátegui",c(23:25)]<-c(73121,37560,35561)
#VEN[VEN$NAME_2=="General Sir Arthur McGregor\n" & VEN$NAME_1=="Anzoátegui",c(23:25)]<-c(9768,5209,4559)
#VEN[VEN$NAME_2=="Lic. Diego Bautista Urban" & VEN$NAME_1=="Anzoátegui",c(23:25)]<-c(37829,18597,19232)
#VEN[VEN$NAME_2=="José Angel Lamas" & VEN$NAME_1=="Aragua",c(23:25)]<-c(32981,16629,16352)
#VEN[VEN$NAME_2=="José R Revenga" & VEN$NAME_1=="Aragua",c(23:25)]<-c(48800,24410,24390)
#VEN[VEN$NAME_2=="Ocumare de la Costa de Oro\n" & VEN$NAME_1=="Aragua",c(23:25)]<-c(12816,6880,5936)
#VEN[VEN$NAME_2=="Ezequiel Zomora" & VEN$NAME_1=="Cojedes",c(23:25)]<-c(106760,53236,53524)
#VEN[VEN$NAME_2=="Romulo Gallegos" & VEN$NAME_1=="Cojedes",c(23:25)]<-c(18297,9353,8944)




install.packages("bigmemory")
library("bigmemory")
install.packages("ff")
library("ff")

x <- read.big.matrix("status.csv", sep = ",", type ="integer",
                     shared = TRUE,col.names=c("station_id","bikes_available","docks_available","time"))
lm.0=biglm
xx<-read.csv.ffdf(file="status.csv",col.names=c("station_id","bikes_available","docks_available","time") ,colClasses=c(station_id="integer",bikes_available="integer",docks_available="integer",time="Date"))
