require(glmnet)
require(data.table)

setwd('C:/mustafa/Seminer/EYS19/Data/Housing_Data/')
veri_yolu="housingdata.csv"
ev_veri=fread(veri_yolu)
sutun_isimler=fread('names.txt',header=F)
names(ev_veri)=sutun_isimler$V1

hedef_degisken=ev_veri$MEDV

ev_veri_matris=as.matrix(ev_veri)
ev_veri_matris=ev_veri_matris[,-ncol(ev_veri_matris)]

# capraz dogrulama ile lasso (alpha=1 varsayılan deger) regresyon 
# farkli lambda (cezalandırma parametresi)- 
# 10 (k=10 varsayilan deger) ayrik alt orneklemi test verisi olarak kullanarak
glmnet_model=cv.glmnet(ev_veri_matris,hedef_degisken)
# farkli lambda degerlerindeki capraz dogrulama hatalari
plot(glmnet_model)

# en az hata veren modelin katsayilarini incele
coef(glmnet_model,s='lambda.min')

# tekduze dagilimdan 100 gurultu degiskeni yarat
satir_sayisi=nrow(ev_veri_matris)
sutun_sayisi=100
gurultu=matrix(runif(satir_sayisi*sutun_sayisi),nrow=satir_sayisi)

# asil veriyle gurultuyu birlestir
gurultulu_veri=cbind(ev_veri_matris,gurultu)

# gurultu iceren veride lasso modeli yap
glmnet_model_gurultu=cv.glmnet(gurultulu_veri,hedef_degisken)
plot(glmnet_model_gurultu)

# minimum hatanın 1 standart sapma içinde olduğu hatayı veren en büyük lamda
# degeri ile bulunan model katsayiları
# daha az karmaşık model bulmak için
coef(glmnet_model_gurultu,s='lambda.1se')
str(glmnet_model_gurultu)

# gurultulu veriden ogrenilen lasso modelinde minimum hata veren lambdanın indeksini bul
en_az_hata_indeks_gur=which(glmnet_model_gurultu$lambda==glmnet_model_gurultu$lambda.min)
# gurultusuz veriden ogrenilen lasso modelinde minimum hata veren lambdanın indeksini bul
en_az_hata_indeks=which(glmnet_model$lambda==glmnet_model$lambda.min)

# En az hata veren lambda değerleri ile öğrenilen modelin
# yüzdesel olarak açıklayabildiği varyansları karşılaştır
glmnet_model_gurultu$glmnet.fit$dev.ratio[en_az_hata_indeks_gur]
glmnet_model$glmnet.fit$dev.ratio[en_az_hata_indeks]

