install.packages("devtools")
install.packages("htmltools")
install.packages("httpuv")
install.packages("mime", dependencies=T)
install.packages("xtable", dependencies=T)
install.packages("magrittr", dependencies=T)
install.packages("crosstalk", dependencies=T)
install.packages("jsonlite", dependencies=T)
install.packages("yaml", dependencies=T)
install.packages("shiny", dependencies=T) # explorar mais
install.packages("Rcpp", dependencies=T)

install.packages("leaflet")


library(magrittr)
library(leaflet)
library(jsonlite)

leaflet() %>% addTiles()
