stackdvi<-c(dvi1992,dvi2006)
pairs(stackdvi)

# Normalized Difference vegetation Index varia da -1 a 1 e quindi permette di comparare immagini con risoluzioni radiometriche diverse
ndvi1992 = dvi1992 / (m1992[[1]]+m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]]+m1992[[2]])

dev.off()
par(mfrow=c(1,2))
plot(ndvi1992, col=clvir)
plot(ndvi2006, col=clvir)

im.dvi(mato
