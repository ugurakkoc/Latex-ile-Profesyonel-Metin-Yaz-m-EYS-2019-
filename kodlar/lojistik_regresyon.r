library(data.table)

setwd('C:/mustafa/Seminer/EYS19/Data/Housing_Data/')
veri_yolu="housingdata.csv"
ev_veri=fread(veri_yolu)
str(ev_veri)

sutun_isimler=fread('names.txt',header=F)
str(sutun_isimler)

# sutun isimlerini degistir
names(ev_veri)=sutun_isimler$V1

# median fiyat uzerine yuksek fiyatli ev olarak tanimla
ev_fiyat=ev_veri$MEDV>median(ev_veri$MEDV)
# TRUE/FALSE (DOGRU/YANLIS) tipinde degiskeni bir ve sifira cevir. 
# 1 yani TRUE yuksek fiyat
ev_veri$MEDV=as.numeric(ev_fiyat)
  
# lojistik regresyon modeli ogren
loj_model=glm(MEDV~.,family=binomial,ev_veri)
summary(loj_model)

# link tahminleri f(x)
tahminler=predict(loj_model,ev_veri)

# olasilik tahminleri e^f(x)/(1+e^f(x))
olasilik_tahminler=predict(loj_model,ev_veri,type='response')

# sinif tahminle
karar_siniri=0.5
tahmini_sinif=as.numeric(olasilik_tahminler>karar_siniri)

# kararsizlik (confusion) matrisi
table(ev_veri$MEDV,tahmini_sinif)
