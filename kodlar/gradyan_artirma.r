n <- 100 # gozlem sayisi
t <- seq(0,4*pi,100)
a <- 3
b <- 2
c.unif <- runif(n)
c.norm <- rnorm(n)
amp <- 2

# veriyi yarat ve bagimli degisken olustur
set.seed(1)
y1 <- a*sin(b*t)+c.unif*amp # tekduze dagilimdan hata ekle
y2 <- a*sin(b*t)+c.norm*amp # normal dagilimdan hata ekle

# goruntule
plot(t, y1, t="l", ylim=range(y1,y2)*c(1,1.2))
lines(t, y2, col=2)
legend("top", legend=c("y1", "y2"), col=1:2, lty=1, ncol=2, bty="n")

require(gbm)

# veri matrisi olustur
dat=data.frame(t=t,y=y1)

# boosting parametreleri
noftrees=100
depth=5
learning_rate=0.1
sampling_fraction=0.5
y=y1

# modeli ogren
boosting_model=gbm(y~., data=dat,distribution = "gaussian", n.trees = noftrees,
        interaction.depth = depth, n.minobsinnode = 5, shrinkage =learning_rate ,
        bag.fraction = sampling_fraction)

# sırayla her agactan tahmin al
for(i in 1:noftrees){
    print(i)
    predicted=predict(boosting_model,dat,n.trees=i)
    plot(t, y, t="l", ylim=range(y1,y2)*c(1,1.2))
    lines(t, predicted, col=2)
    legend("top", legend=c("y", "predicted"), col=1:2, lty=1, ncol=2, bty="n")
    if(i %% 10 ==0){
        Sys.sleep(1)
    }
}        
