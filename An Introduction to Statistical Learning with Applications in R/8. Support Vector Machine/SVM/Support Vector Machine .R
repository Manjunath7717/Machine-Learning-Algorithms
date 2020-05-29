#Support Vector Machine
#to fit an SVM using a non-linear kernel
library(e1071)
set.seed (1)
x=matrix(rnorm(200*2), ncol=2)
x[1:100,]=x[1:100,]+2
x[101:150,]=x[101:150,]-2
y=c(rep(1,150),rep(2,50))
dat=data.frame(x=x,y=as.factor(y))
plot(x, col=y)
train=sample(200,100)
#kernel Radial
svmfit=svm(y~., data=dat[train,], kernel="radial", gamma=1,cost =1)
plot(svmfit , dat[train ,])
summary(svmfit)
# with cost 1e5
svmfit=svm(y~., data=dat[train,], kernel="radial",gamma=1, cost=1e5)
plot(svmfit ,dat[train ,])

# We can perform cross-validation using tune() to select the best choice of γ and cost for an SVM with a radial kernel:
set.seed (1)
tune.out=tune(svm, y~., data=dat[train,], kernel="radial",ranges=list(cost=c(0.1,1,10,100,1000),gamma=c(0.5,1,2,3,4) ))
summary(tune.out)
table(true=dat[-train,"y"], pred=predict(tune.out$best.model, newdata=dat[-train ,]))

#Roc Curve
library(ROCR) 
rocplot=function(pred, truth, ...){
  predob = prediction (pred, truth)
  perf = performance (predob , "tpr", "fpr") 
  plot(perf ,...)
}
svmfit.opt=svm(y~., data=dat[train,], kernel="radial", gamma=2, cost=1,decision.values=T)
fitted=attributes(predict(svmfit.opt,dat[train,],decision.values=TRUE))$decision.values
par(mfrow=c(1,2))
rocplot(fitted ,dat[train ,"y"],main="Training Data")
svmfit.flex=svm(y~., data=dat[train,], kernel="radial", gamma=50, cost=1, decision.values=T)
fitted=attributes(predict(svmfit.flex,dat[train,],decision.values=T))$decision.values
rocplot(fitted ,dat[train ,"y"],add=T,col="red")



#SVM with Multiple Classes
set.seed (1)
x=rbind(x, matrix(rnorm(50*2), ncol=2))
y=c(y, rep(0,50))
x[y==0,2]=x[y==0,2]+2
dat=data.frame(x=x, y=as.factor(y))
par(mfrow=c(1,1))
plot(x,col=(y+1))
svmfit=svm(y~., data=dat, kernel="radial", cost=10, gamma=1)
plot(svmfit , dat)




