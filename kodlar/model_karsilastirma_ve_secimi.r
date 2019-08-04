library(caret)

setwd('C:/mustafa/Seminer/EYS19/Data/Housing_Data/')
veri_yolu="housingdata.csv"
ev_veri=fread(veri_yolu)
sutun_isimler=fread('names.txt',header=F)
names(ev_veri)=sutun_isimler$V1

## 5 tekrarl�, 10lu �apraz do�rulama
fit_control <- trainControl(method = "repeatedcv",
                           number = 10,
                           repeats = 5)

# Karar a�ac�: karma��kl�k parametresi						   
agac_grid=expand.grid(cp =c(0,0.005,0.01,0.02,0.05))
set.seed(825)
# Karar a�ac� 
model_agac=train(MEDV ~ ., data = ev_veri,
               method = "rpart",
               trControl = fit_control,
			   tuneGrid = agac_grid)
			   
model_agac$results 
trellis.par.set(caretTheme())
plot(model_agac)  

# en iyi modelle al�nan tahminler
ogrenme_veri_tahmin=predict(model_agac,ev_veri)
plot(ev_veri$MEDV,ogrenme_veri_tahmin)
abline(a=0,b=1,col='red',lty=2,lwd=2)

# cezaland�rmal� regresyon
set.seed(825)
glmnet_modeli=train(MEDV ~ ., data = ev_veri,
               method = "glmnet",
               trControl = fit_control)
			   
glmnet_modeli$results 
trellis.par.set(caretTheme())
plot(glmnet_modeli)  

# en yak�n kom�u: ka� kom�u?
en_yakin_komsu_grid=expand.grid(k =c(1:10))
# en yak�n kom�u
set.seed(825)
en_yakin_komsu_modeli=train(MEDV ~ ., data = ev_veri,
               method = "knn",
               trControl = fit_control,
			   tuneGrid = en_yakin_komsu_grid)
			   
en_yakin_komsu_modeli$results 
trellis.par.set(caretTheme())
plot(en_yakin_komsu_modeli )  

# rassal orman: ka� rastgele de�i�ken?
rassal_orman_grid=expand.grid(mtry=c(2:5))
# rassal orman
set.seed(825)
rassal_orman_modeli=train(MEDV ~ ., data = ev_veri,
               method = "rf",
               trControl = fit_control,
			   tuneGrid = rassal_orman_grid,
			   ntree=100)
			   
rassal_orman_modeli$results 
trellis.par.set(caretTheme())
plot(rassal_orman_modeli)  

## en az hatal� modelin en fazla y�zde ikisi k�t�l�kte daha basit model
secilen=tolerance(rassal_orman_modeli$results, metric = "RMSE", 
                         tol = 2, maximize = FALSE)  

rassal_orman_modeli$results[secilen,]


# gradyan art�rma (derinlik, a�a� say�s�, ��renme h�z�, yaprak d���mdeki g�zlem say�s�
gbm_grid=expand.grid(interaction.depth = c(1, 3, 5), 
                        n.trees = (1:5)*20, 
                        shrinkage = 0.1,
                        n.minobsinnode = 20)                  
set.seed(825)
model_gbm=train(MEDV ~ ., data = ev_veri, 
                 method = "gbm", 
                 trControl = fit_control, 
                 verbose = FALSE, 
                 tuneGrid = gbm_grid)
				 
trellis.par.set(caretTheme())
plot(model_gbm)  		

secilen=tolerance(model_gbm$results, metric = "RMSE", 
                         tol = 2, maximize = FALSE)  

## en az hatal� modelin en fazla y�zde ikisi k�t�l�kte daha basit model
model_gbm$results[secilen,]
	 

