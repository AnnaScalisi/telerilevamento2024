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

dev.off()
im.plotRGB(stacksent, 4, 3, 2) 

par(mfrow=c(1, 3)) #chi cambia i colori e la nir la banda non correlata alle altre
im.plotRGB(stacksent, 3, 2, 1) #n natural colors
im.plotRGB(stacksent, 4, 2, 1) # nir on red
im.plotRGB(stacksent, 4, 3, 1)

dev.off()

# nir on green tutto quello che è nell'infrarosso diventa verde fluo (la vegetazione), il suolo nudo diventa rosa
im.plotRGB(stacksent, 3, 4, 2) #nir on green

# nir on blue suolo nudo diventa giallo colore che colpisce di più l'occhio umano
im.plotRGB(stacksent, 3, 2, 4) # nir on blue

# multiframe con le 4 immagini insieme
par(mfrow=c(2, 2))
im.plotRGB(stacksent, 3, 2, 1) #n natural colors
im.plotRGB(stacksent, 4, 2, 1) # nir on red
im.plotRGB(stacksent, 3, 4, 2) #nir on green
im.plotRGB(stacksent, 3, 2, 4) # nir on blue

# correlation of information
pair(stacksent) # nella diagonale abbiamo le bande, e le loro distribuzioni di frequenza. I grafici sono la distribuzione dei vari pixel banda contro banda. Indice di correlazione di Pearson va da 0 a 1.

# info sulle immagini
b2
ncell(b2) # calcolo numero di pixel
