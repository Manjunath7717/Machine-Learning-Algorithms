x <- c(1,3,2,5)

x
length (x)

x = c(1,6,2)

x
length (x)

y= c(1,4,3)

x+y

x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
x

x=matrix(c(1,2,3,4) ,2,2)
sqrt(x)

matrix(c(1,2,3,4),2,2,byrow=TRUE)

A=matrix(1:16,4,4)
A

x=rnorm(50)
y=x+rnorm(50,mean=50,sd=.1) 
cor(x,y)


set.seed (3)
y=rnorm(1000)
mean(y)
var(y)
sqrt(var(y))
sd(y)

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")

pdf("Figure.pdf")
plot(x,y,col="red")
dev.off()

x=seq(1,10) 
x
x=1:10
x
x=seq(-pi,pi,length=50)
x

y=x
f=outer(x,y,function (x,y)cos(y)/(1+x^2))
contour (x,y,f)
contour(x,y,f,nlevels=45,add=T)
fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)


image(x,y,fa)
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=70)
persp(x,y,fa,theta=30,phi=40)

Auto=read.table("Auto.data.txt")

Auto=read.csv("Auto.csv",header=T,na.strings ="?")

Auto
dim(Auto)

Auto=na.omit(Auto)

dim(Auto)

names(Auto)

attach(Auto)
plot(cylinders, mpg)

plot(Auto$cylinders , Auto$mpg )

attach(Auto)
cylinders=as.factor(cylinders)

Auto

#plot(cylinders ,mpg )
plot(cylinders,mpg, col="red",horizontal=T,ylab =" MPG ", xlab="cylinders")
plot(cylinders,mpg, col="blue",varwidth=F,ylab =" MPG ", xlab="cylinders")


hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)


pairs(Auto)


plot(horsepower ,mpg)
#identify(horsepower,mpg,name)


summary(Auto)

summary(mpg)


