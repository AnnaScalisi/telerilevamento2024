library(terra)
library(imageRy)
im.list() # non ci sono argomenti dentro questa funzione
b2<-im.import("sentinel.dolomites.b2.tif")
b3<-im.import("sentinel.dolomites.b3.tif")
b4<-im.import("sentinel.dolomites.b4.tif")
b8<-im.import("sentinel.dolomites.b8.tif")

#multiframe
par(mfrow=c(2,2))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# multiframe 2
#stack:creo immagine satellitare multispettrale, perchè metto insieme tanti spettri.
stacksent<- c(b2, b3, b4, b8)
plot(stacksent) #, col=clch)

#plotto solo la quarta banda dello stack
dev.off() #chiude il device la finestra grafica in questo caso
plot(stacksent[[4]]) #nome stack con il 4 livello

#RGB plotting
# stacksent[[1]] = b2 = blue
# stacksent[[2]] = b3 = green
# stacksent[[3]] = b4 = red
# stacksent[[4]] = b8 = nir

im.plotRGB(stacksent, r=3, g=2, b=1) #immagine con colori naturali
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1) #sostituisco la banda del rosso con quella del nir

# esercizio: 
par(mfrow=c())
