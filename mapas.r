library(ggplot2)
library(maps)
library(rgdal)
library(rgeos)
library(RColorBrewer)

color <- c();

for (i in 1:246) {
  
  switch (i%/%20,
      color[i]<- "orangered1",
      color[i]<- "orange2",
      color[i]<- "sienna3",
      color[i]<- "darkred",
      color[i]<- "yellow3",
      color[i]<- "darkgrey",
      color[i]<- "yellowgreen",
      color[i]<- "orangered3",
      color[i]<- "orangered4",
      color[i]<- "orange3",
      color[i]<- "burlywood2",
      color[i]<- "gold2",
      color[i]<- "orangered2",
      color[i]<- "palevioletred4",
      
  )
  if(i%/%20 == 0) color[i]<- "gold3"
}

ggplot()+ borders("world", regions = "brazil",fill = "light blue")+coord_equal()+theme(axis.text=element_text(size=12),axis.title=element_text(size=14,face="bold"))

goias<- readOGR(".","52MUE250GC_SIR")

goias.f<-fortify(goias, region = "CD_GEOCMU")

ggplot(goias.f)+aes(goias.f$long, goias.f$lat,group = goias.f$group)+ geom_polygon(colour = "black", fill = goias.f$group)+ coord_equal() + labs(x= "Longitude",y= "Latitude")

testeG1<-ggplot(goias.f)+aes(goias.f$long, goias.f$lat,group = goias.f$group,fill = goias.f$group)+ geom_polygon(colour = "black")+ coord_equal() + labs(x= "Longitude",y= "Latitude")+ theme(legend.position = "none")

testeG2<-ggplot(goias.f)+aes(goias.f$long, goias.f$lat,group = goias.f$group)+ geom_polygon(colour = "black",fill = "darkgrey")+ coord_equal() + labs(x= "Longitude",y= "Latitude")+ theme(legend.position = "none")

testeG3<-ggplot(goias.f)+aes(goias.f$long, goias.f$lat,group = goias.f$group,fill = goias.f$id)+ geom_polygon(colour = "black")+ coord_equal() + labs(x= "Longitude",y= "Latitude")+ theme(legend.position = "none")+scale_fill_manual(values = color)


