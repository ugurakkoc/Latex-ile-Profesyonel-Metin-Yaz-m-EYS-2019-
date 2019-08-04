library(randomForest)
library(data.table)

setwd('C:/mustafa/Seminer/EYS19/Data/Housing_Data/')
veri_yolu="housingdata.csv"
ev_veri=fread(veri_yolu)
sutun_isimler=fread('names.txt',header=F)
names(ev_veri)=sutun_isimler$V1

# rassal orman öğrenme
agac=randomForest(MEDV~.,ev_veri)
# torba dışı (out-of-bag) örneklerdeki performansın ağaç sayısı arttıkça
# davranışını göslemleyelim
plot(agac)
# model yorumlama için değişken önemine bakalım
varImpPlot(agac)

# en önemli değişken olan RM'nin hedef değişken üzerine 
# model tarafından öğrenilen ortalama etkisine bakalım
partialPlot(agac,ev_veri,'RM')