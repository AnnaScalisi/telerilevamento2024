# Second method to quantify changes in time
# NO2 ossido di azoto diminuisce in tempo di covid.
# The first method was based on classifiction
library(terra)
library(imageRy)
im.list()

#importing data
EN01<-im.import("EN_01.png")
EN13<-im.import("EN_13.png")

par(mfrow=c(2,1))
im.plotRGB.auto(EN01) # questo comando permette di creare dei plot che prendono automaticamente le prime 3 bande
im.plotRGB.auto(EN13)

# fare una differenziazione tra due layer di due anni diversi. importante che sia la stessa banda
difEN = EN01[[1]] - EN13[[1]] # pixel del primo livello del EN01- pixel del primo livello del EN13, quali sono i punti dell'europa che hanno avuto un cambiamento più sentito
cl <- colorRampPalette(c("blue", "white","red")) (100)
plot(difEN, col=cl) # blu cambiamento più alto. quantifichiamo il cambiamento. immagini ad 8bit da 0 a 255 perchè 2 alla ottava
dev.off() # tolgo il grafico di prima
