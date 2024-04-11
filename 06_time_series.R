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

## Ice melt in Greenland
# per farlo uso una variabile proxy, dataset land surface temperature, temperatura del suolo
g2000 <- im.import("greenland.2000.tif") # sono immagini a 16bit
clg <- colorRampPalette(c("black","blue", "white","red")) (100) # il nero è la T più bassa.
plot(g2000, col=clg)

g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

par(mfrow=c(2,2))
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)

# se ho layer singoli posso fare uno stack mettendo i layer tutti insieme
greenland <- c(g2000,g2005,g2010,g2015)
plot(greenland, col=clg)

dev.off() # perchè prima avevamo fatto un par
# prendo l'immagine con quattro livelli e faccio la differenza tra il primo e il quettro livello
difg = greenland[[1]]- greenland[[4]]
plot(difg, col=clg) # zone blu dove la T è aumentata
clgreen <- colorRampPalette(c("red", "white","blue")) (100) # valori rossi dove la t è aumentata
plot(difg, col=clgreen)

# prendiamo 3 livelli di un rgb, e per ogni livello ci metto un layer.
im.plotRGB(greenland, r=1, g=2, b=4) # g2000 on red, g2005 on green, g2015 on blue
# quantifico il cambiamento con valori continui, differenza tra la immagini.
