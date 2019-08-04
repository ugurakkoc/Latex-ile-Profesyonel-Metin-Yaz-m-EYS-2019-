require(data.table)
# aynı şekilde çalıştıralabilir
library(data.table)

setwd('C:/mustafa/Seminer/EYS19/Data/Housing_Data/')
veri_yolu="housingdata.csv"
ev_veri=fread(veri_yolu)
str(ev_veri)

# eski usül
ev_veri_df=read.csv(veri_yolu)
str(ev_veri_df)

sutun_isimler=fread('names.txt',header=F)
str(sutun_isimler)

# sutun isimlerini degistir
names(ev_veri)=sutun_isimler$V1

# dogrusal regresyon
dogrusal_reg=lm(MEDV~.,data=ev_veri)

# ozet bilgi
summary(dogrusal_reg)
anova(dogrusal_reg)

# kesensiz dogrusal regresyon
kesensiz_dogrusal_reg=lm(MEDV~-1+.,data=ev_veri)

# ozet bilgi
summary(kesensiz_dogrusal_reg)

# dogrusal olmayan regresyon varsayimlarinin incelenmesi
plot(kesensiz_dogrusal_reg)

# ogretmen basına dusen ogrenciye gore dogrusal regresyon
ogretmen_dogrusal_reg=lm(MEDV~PTRATIO+AGE,data=ev_veri)

# ozet bilgi
summary(ogretmen_dogrusal_reg)

# dogrusal olmayan etkilerin modellenmesi
ogretmen_dogrusalolmayan_reg=lm(MEDV~PTRATIO*AGE,data=ev_veri)
summary(ogretmen_dogrusalolmayan_reg)

# tahmini degerleri bulma
tahminler=predict(kesensiz_dogrusal_reg,ev_veri)
plot(ev_veri$MEDV,tahminler)