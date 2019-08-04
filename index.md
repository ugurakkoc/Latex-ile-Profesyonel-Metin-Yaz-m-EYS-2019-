Bu site 2019 Ekonomi Yaz Seminerleri derslerinden Veri Madenciliği için İstatiksel Öğrenme dökümanlarını içermektedir. (Eğitmen: Mustafa Gökçe Baydoğan)
## Hazırlık

Aşağıda yer alan dokümanlar [Berk Orbay](http://berkorbay.me/) ile birlikte Akademik Bilişim Konferans'ı bünyesinde düzenlediğimiz R ile Veri Analizi dersi için oluşturulmuştur. Dokümanlara bu [bağlantı](https://r338.github.io/ab-2018/) üzerinden de ulaşılabilir.
+ [R'a Giriş Dokümanı](dokumanlar/RHizliGiris.pdf)
+ [temel R Dokümanı](http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf)([Türkçe](https://github.com/rstudio/cheatsheets/raw/master/translations/turkish/baseR_translate_tr.pdf))
+ [dplyr R Dokümanı](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf) ([Türkçe](dokumanlar/DataTransformationCheatSheet_Turkish.pdf))
+ [ggplot2 R Dokümanı](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf) ([Türkçe](https://github.com/rstudio/cheatsheets/raw/master/translations/turkish/ggplot2_2.0_Turkish.pdf))
+ [rmarkdown R Dokümanı](https://github.com/rstudio/cheatsheets/raw/master/rmarkdown-2.0.pdf)

## Dökümanlar

Gün 1 - Veri Madenciliğine Giriş. (22 Temmuz 2019)

+ [Veri Madenciliği Nedir?](dokumanlar/ders_notlari/VeriMadenciliği.pdf)
+ [Veri Nedir?](dokumanlar/ders_notlari/VeriNedir.pdf)
+ [Boyut Küçültme](dokumanlar/ders_notlari/VeriKüçültme.pdf)

Gün 2 - R ile Programlamaya Giriş. (23 Temmuz 2019)

+ [Başlangıç Kodları - Temel R](kodlar/baslangic.r)
+ [Pi Tahmini Kodları](kodlar/pi_tahmini.r)
+ [Temel Bileşen Analizi Kodları](kodlar/temel_bilesen_analizi.r) [Şarap Kalitesi Verisi](veriler/winequality-white.csv)
+ [Çok Boyutlu Ölçekleme Kodları](kodlar/mds_analiz.r) [Şehirlerarası Karayolu Uzaklıkları Verisi](veriler/InClass_MDS_distance_city.csv)

Gün 3 - Eğitmenli (Supervised) Öğrenme. (24 Temmuz 2019)

+ İstatiksel Öğrenme (Sınıflandırma ve Regresyon) Giriş [İngilizce Doküman](dokumanlar/ders_notlari/istatiksel_ogrenme_ingilizce.pdf)
+ Sınıflandırma ve Regresyon [Türkçe Doküman](dokumanlar/ders_notlari/SınıflandırmaVeRegresyon.pdf) ve [Boston Ev Fiyatları Verisi](veriler/Housing_Data.zip)
+ [Doğrusal Regresyon Kodları](kodlar/dogrusal_regresyon.r)
+ [Lojistik Regresyon Kodları](kodlar/lojistik_regresyon.r) 
+ [Cezalandırmalı Regresyon Kodları](kodlar/cezalandirmali_regresyon.r) 

Gün 4 - Eğitmenli (Supervised) Öğrenme (Devam). (25 Temmuz 2019)
+ En Yakın Komşu Yöntemi [EYK Sınıflandırma Kodları](kodlar/enyakinkomsu_ecg.r) [ECG Verisi](veriler/ecg_verisi.zip)
+ Karar Ağaçları [Karar Ağacı Kodları](kodlar/karar_agaci.r)
+ Topluluk Yöntemleri
	+ Paralel topluluklar
		+ Rastgele (Rassal) Orman [Rassal Orman Kodları](kodlar/rassal_orman.r)
	+ Seri topluluklar
		+ Gradyan Artırma [Gradyan Artırma Kodları](kodlar/gradyan_artirma.r)

Gün 5 - Eğitmenli (Supervised) Öğrenme (Devam) - Eğitmensiz (Unsupervised) Öğrenme. (26 Temmuz 2019)
+ Model Değerlendirme ve Seçimi
	+ [Caret Paketi](https://topepo.github.io/caret/) ve [Caret Paketindeki Modeller](https://topepo.github.io/caret/available-models.html)
	+ [Örnek Model Seçim Kodları](kodlar/model_karsilastirma_ve_secimi.r)
+ Öbekleme (Kümeleme) Yöntemleri
	
## Faydalı bağlantılar
+ [Makine Öğrenmesi Ders Videoları ve Notları - Veri Defteri](http://www.veridefteri.com/category/ders/)
+ Twitter APIsine bağlanma ve twitteR paketi kullanımı
	+ [APIye bağlanma](https://towardsdatascience.com/access-data-from-twitter-api-using-r-and-or-python-b8ac342d3efe)
	+ [Twitter verisi ve kelime bulutu gösterimi](https://mikeyharper.uk/creating-twitter-wordclouds/)