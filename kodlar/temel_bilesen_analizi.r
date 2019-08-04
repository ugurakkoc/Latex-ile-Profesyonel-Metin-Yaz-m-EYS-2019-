veri_yolu="C:\\mustafa\\Seminer\\EYS19\\Data\\winequality-white.csv"
veri=read.csv(veri_yolu,sep=";")

# kalite dagilimini inceleyelim
hist(veri$quality)

# median kalite degeri
median_kalite=median(veri$quality)

# kalite mediandan buyukse kaliteli (TRUE), degilse (FALSE) kalitesiz olarak sinif yaratalim.
kalite=veri$quality>median_kalite

str(veri)
satir_sayisi=nrow(veri)
sutun_sayisi=ncol(veri)

# sadece olcumleri almak icin son sutunu (kalite sutununu atalim)
olcum_verileri=veri[,-sutun_sayisi]
summary(olcum_verileri)

# olcum verisini standardize edelim
olcum_verileri_olcekli=scale(olcum_verileri)
summary(olcum_verileri_olcekli)

# temel bilesen analizini uygulayalim.
tba=princomp(olcum_verileri_olcekli)

str(tba)
# list tipi objelerin elemanlarina ulasim
tba$call
tba[[1]]

# her bilesenin varyansin ne kadarini acikladigini cubuk grafik gosterimi
plot(tba)

# tba sonuclarinin ozeti
summary(tba)

# yeni uzay
yeni_uzay=tba$scores

# yeni uzayda ilk iki boyutu alirsak (veriyi 2 boyuta dusurursek) sinif atamasina gore grafik gosterimi
plot(yeni_uzay[,1:2],col=kalite+1)

# tba sonucu ozetinin oz vektorler ile birlikte gosterimi
summary(tba,loadings=T)

