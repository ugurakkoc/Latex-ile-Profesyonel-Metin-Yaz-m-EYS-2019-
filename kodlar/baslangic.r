sayi=3
carpan=5
sonuc=sayi*carpan

# alternatif atama
sayi<-5
sonuc=sayi*carpan

# yapisini kontrol edelim
str(sayi)
str(carpan)

# carpani Denizli yap
carpan="denizli"
str(carpan)
sonuc=sayi*carpan

# diziler
ornek_dizi=c(5,10,-3,0.5,1,3,5)
ornek_dizi
str(ornek_dizi)
length(ornek_dizi)

# indeksleme
# besinci eleman
ornek_dizi[5]
# ilk üc eleman
ornek_dizi[1:3]
# son elemani at
ornek_dizi[-7]
# Denizli ekle
ornek_dizi[10]="Denizli"
str(ornek_dizi)

numerik_kisim=ornek_dizi[1:7]
numerik_kisim=as.numeric(numerik_kisim)

as.numeric(ornek_dizi)

# besten kücük esitleri bul
kucuk_bes=numerik_kisim<=5
str(kucuk_bes)
# besten kücük esitleri goster
numerik_kisim[kucuk_bes]
# indeksleri getir
kucuk_indeks=which(kucuk_bes)

# dizi icideki sayilari topla
toplam=sum(numerik_kisim)
# dizi icinde besten kucuk kac sayi var
say_besten_kucuk=sum(kucuk_bes)

# tum elemanlari onla carp
onla_carpim=10*(numerik_kisim-3)
onla_carpim

# dizi dizi carpimi
carp_dizi=c(0,2)
carpim=numerik_kisim*carp_dizi
carpim

#10 uzunlugunda 5 iceren dizi
tekrarlidizi=rep(5,10)
tekrarlidizi_v2=rep(1:3,10)

#matris
ornek_matrix=matrix(0,10,20)
str(ornek_matrix)

# farkli arguman sirasi
ornek_matrix=matrix(ncol=100,data=1,nrow=1000)

ornek_matrix=matrix(0,10,20)
str(ornek_matrix)

#indeksleme
ornek_matrix[1,5]=5
ornek_matrix[2,10]=-5
ornek_matrix[5,1]=10

#indeksleme
#satirlar
ornek_matrix[1,]=-2
ornek_matrix[1:3,]

#sutunlar
ornek_matrix[,3]
ornek_matrix[,3:5]
#sutun atma
eksik_matrix=ornek_matrix[,-c(3:5)]

toplam=sum(eksik_matrix)
satir_toplami=rowSums(eksik_matrix)
sutun_toplami=colSums(eksik_matrix)

max_deger=max(eksik_matrix)
enbuyuk_index=which(eksik_matrix==max_deger,arr.ind=T)

# csv dosyasinda veri okuma
dosya_yolu="C:/mustafa/Seminer/EYS19/Data/deprem20yil.csv"
deprem_verisi=read.csv(dosya_yolu)

str(deprem_verisi)

# indeksleme
deprem_verisi[1,]
deprem_verisi[,2]
deprem_verisi[5,6]

deprem_verisi$Boylam[5]

# istatistiki bilgiler
summary(deprem_verisi)

#derinligi ondan kucuk esit veriyi filtrele
filtrelenmis_veri=deprem_verisi[deprem_verisi$Derinlik<=10,]

filtrelenmis_veri[1,]

# buyukluge gore sirala
sirali=order(c(3,6,7,1))
sirali
buyukluge_gore_indeks=order(filtrelenmis_veri$Buyukluk,decreasing=TRUE)
buyukluge_gore_indeks=order(-filtrelenmis_veri$Buyukluk)

buyukluge_gore_indeks
filtrelenmis_veri=filtrelenmis_veri[buyukluge_gore_indeks,]

# kontrol et ve carp

deger=7

if(deger>10){
  print("Büyük")
} else if(deger==10){
  print("Eşit")
} else if(deger>6){
  print("6dan büyük 10dan kücük")  
} else {
  print("Küçük")
} 

# on ile altı arasında mı (dahil)
deger=7

if(deger<=10 & deger>=6 ){
  print("evet")
  sonuc=deger*5
  print(sonuc)
}


# on ile altı arasında mı (dahil)
deger=10

if(deger<=10 | deger>=12){
  print("evet")
  sonuc=deger*5
  print(sonuc)
}

#donguler
# k ya kadar sayi yazdirma
k=10
for(i in 1:k){
  print(i)
}

degerler=c(2,10,32,50)

print(degerler)
for(i in degerler){
  print(i)
}

# faktoriyel
sonuc=1
k=10
for(deger in 1:k){
  sonuc=sonuc*deger
  print(sonuc)
}

sonuc=1
iter=1
k=10
while(iter<=k){
  print(iter)
  sonuc=sonuc*iter
  print(sonuc) 
  iter=iter+1
}
