library(rpart)
library(rattle)
library(randomForest)
library(data.table)

setwd('C:/mustafa/Seminer/EYS19/Data/Housing_Data/')
veri_yolu="housingdata.csv"
ev_veri=fread(veri_yolu)
sutun_isimler=fread('names.txt',header=F)
names(ev_veri)=sutun_isimler$V1

# regresyon ağacı öğrenelim
agac=rpart(MEDV~.,ev_veri)

# karar ağacını görselleştirelim
fancyRpartPlot(agac)

# karar ağacı parametrelerini degistirelim
# minbucket en dip düğümdeki gözlem sayısını sınırlayıp
# karmaşıklık parametresini 0 yapalım
agac=rpart(MEDV~.,ev_veri,control=rpart.control(cp=0,minbucket=30))
# karar ağacını görselleştirelim
fancyRpartPlot(agac)

# sınıflandırma için hedef değişkenimizi ikili değişkene çevirelim
ev_fiyat=ev_veri$MEDV>median(ev_veri$MEDV)
ev_veri$MEDV=as.numeric(ev_fiyat)
# sınıflandırma ağacı öğrenelim
agac=rpart(MEDV~.,ev_veri,method='class')
# sınıflandırma ağacını görselleştirelim
fancyRpartPlot(agac)

