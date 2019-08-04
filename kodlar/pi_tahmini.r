set.seed(1)
gozlem_sayisi=100000
ilk_eksen=runif(gozlem_sayisi,-1,1)
ikinci_eksen=runif(gozlem_sayisi,-1,1)

# veriyi birlestir
birlesmis=cbind(ilk_eksen,ikinci_eksen)

# cok fazla nokta ile gorsellestirme zamani uzayabilir
# o yuzden asagidaki iki satir yorum olarak isaretlendi
# plot(birlesmis)
# plot(ilk_eksen,ikinci_eksen)

# sure tutma
dongu_baslama=Sys.time() # baslangic zamani

# dongulerle (0,0) noktasina uzaklik hesabı
uzaklik=rep(0,gozlem_sayisi)
cember_disi_sayisi=0
for(i in 1:gozlem_sayisi){
  uzaklik[i]= ilk_eksen[i]^2 + ikinci_eksen[i]^2
  uzaklik[i]= sqrt(uzaklik[i])
  if(uzaklik[i]>1){
    # daire disinda nokta bulunca ekrana yazmak istersek yorumu kaldirabiliriz.
    #print("daire dışında") 
    cember_disi_sayisi=cember_disi_sayisi+1
  }
}

print(cember_disi_sayisi)
tahmini_pi=4*(gozlem_sayisi-cember_disi_sayisi)/gozlem_sayisi
print(tahmini_pi)

dongu_bitis=Sys.time() # bitis zamani

vektorel_baslama=Sys.time() # baslangic zamani
# vektorel hesaplama
uzaklik=sqrt(ilk_eksen^2 + ikinci_eksen^2)
cember_disi_sayisi=sum(uzaklik>1)
print(cember_disi_sayisi)
tahmini_pi=4*(gozlem_sayisi-cember_disi_sayisi)/gozlem_sayisi
print(tahmini_pi)
vektorel_bitis=Sys.time() # bitis zamani

print(dongu_bitis-dongu_baslama) # dongu gecen sure
print(vektorel_bitis-vektorel_baslama) # vektorel hesaplama gecen sure

# grafik gosterim
renk=as.numeric(uzaklik>1)
plot(birlesmis,col=renk+1)
