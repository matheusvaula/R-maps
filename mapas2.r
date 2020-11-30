library(ggplot2)
library(maps)
library(rgdal)
library(rgeos)
library(RColorBrewer)

brasil<- readOGR(".","RG2017_regioesgeograficas2017")

brasil.f<-fortify(brasil, region = "CD_GEOCODI")

names(brasil)[3]<-c("id")

brasil.f<-merge(brasil.f,brasil[,c("id","UF")],by.y= "id")

ggplot(brasil.f)+aes(brasil.f$long, brasil.f$lat,group = brasil.f$group, fill = brasil.f$UF,)+ geom_polygon(colour = "black")+ coord_equal() + labs(x= "Longitude",y= "Latitude",title = "Mapa Geográfico do Brasil")+ theme(legend.position = "none")+theme(axis.text=element_text(size=30),axis.title=element_text(size=34,face="bold"),plot.title = element_text(size=55))
