# dosya isimleri ve yollarını uygun bir sekilde ayarlayalim
setwd('C:/mustafa/Seminer/EYS19/Data')

fname='ecgTRAIN' # dosya ismi
traindata <- as.matrix(read.table(fname))  # traindata içine veriyi okuyalım
#ilk sutun sinif bilgisi
trainclass=traindata[,1] # -1 ve 1 alıyor
# ilk sutunu atalim
traindata=traindata[,2:ncol(traindata)]
print(dim(traindata)) #96 uzunluğunda (sutunlar) 100 zaman serisi (satirlar) bulunuyor
tlength=ncol(traindata)
noftimeseries=nrow(traindata)

#ilk seriyi çizelim
plot(traindata[1,])
#ilk seriyi çizelim çizgi olarak çizelim
plot(traindata[1,],type='l')

# tek ekranda birden çok zaman serisi grafiği çizelim
par(mfrow=c(2,2)) #2x2 grid
plot(traindata[1,],type='l')
plot(traindata[2,],type='l')
plot(traindata[3,],type='l')	
plot(traindata[4,],type='l')

# tek grafikte birden çok zaman serisi çizelim ve sınıfa göre renklendirelim
plot(traindata[1,],type='l',col=trainclass[1]+2)
points(traindata[2,],type='l',col=trainclass[2]+2)
points(traindata[3,],type='l',col=trainclass[3]+2)	
points(traindata[4,],type='l',col=trainclass[4]+2) 

# limitler ile ilgili sorun yaşadık, düzeltelim
lim=max(abs(traindata[1:4,])) # ilk dört serinin mutlak olarak en büyük gözlemlenen değeri
plot(traindata[1,],type='l',col=trainclass[1]+2,ylim=c(-1.1*lim,1.1*lim))
points(traindata[2,],type='l',col=trainclass[2]+2)
points(traindata[3,],type='l',col=trainclass[3]+2)	
points(traindata[4,],type='l',col=trainclass[4]+2) 

# test verisini okuyalım
fname='ecgTEST' 
testdata <- as.matrix(read.table(fname))  # testdata içine okuduk
#ilk sutun sınıf bilgisi
testclass=testdata[,1] # -1 ve 1 alıyor
#ilk sutun (sınıf sütunu) attık
testdata=testdata[,2:ncol(testdata)]

#ilk test serisinin diğer tüm serilere uzaklığını bulalım
combined=rbind(testdata[1,],traindata)
distMatrix=dist(combined)
print(str(distMatrix)) #uzaklık matrisi
#normal matrise çevirelim
distMatrix=as.matrix(distMatrix)

# komşuları bulalım
neighborhood=order(distMatrix[1,]) # ilk sırada kendisi çıktı

# 1-NN
neighbor=neighborhood[2]-1 # neden eksi bir? cunku ilk sıraya test verimizi koymuştuk
prediction=trainclass[neighbor]

# en yakın komşuyu çizdirelim
par(mfrow=c(2,1)) #2x1 grid
plot(testdata[1,],type='l',main='Test Verisi',col=testclass[1]+2)
plot(traindata[neighbor,],type='l',main='Öğrenme Verisindeki En Yakın Komşu',col=trainclass[neighbor]+2)

# FNN paketi ile daha kolay, eğer yüklü değilse
# install.packages('FNN') 
require(FNN)
tahmini_sinif=knn(traindata, testdata, trainclass, k = 1)