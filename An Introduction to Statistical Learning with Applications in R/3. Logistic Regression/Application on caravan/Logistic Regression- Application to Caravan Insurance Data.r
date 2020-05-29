library(ISLR)

Caravan

dim(Caravan)

attach(Caravan)
summary(Purchase)

348/5822

plot(Purchase)

standardized.X=scale(Caravan [,-86])

var ( Caravan [ ,1])

var ( Caravan [ ,2])

var(standardized.X[,1])

var(standardized.X[,2])

standardized.X

test =1:1000
train.X=standardized.X[-test ,]
test.X=standardized.X[test ,]
train.Y=Purchase [-test]
test.Y=Purchase [test]


glm.fit=glm(Purchase~.,data=Caravan ,family=binomial, subset=-test)


glm.probs=predict(glm.fit,Caravan[test,],type="response")
glm.pred=rep("No",1000)
glm.pred[glm.probs >.5]="Yes"
table(glm.pred,test.Y)

glm.pred=rep("No",1000)
glm.pred[glm.probs >.25]=" Yes"
table(glm.pred,test.Y)

11/(22+11)


