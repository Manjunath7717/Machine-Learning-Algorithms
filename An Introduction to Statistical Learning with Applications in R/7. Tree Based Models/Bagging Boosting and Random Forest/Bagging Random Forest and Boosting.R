# Bagging and Random Forests
library(randomForest)

#Bagging
set.seed (1)
bag.boston=randomForest(medv~.,data=Boston,subset=train,mtry=13,importance =TRUE)
bag.boston
yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
plot(yhat.bag, boston.test)
abline(0,1)
mean((yhat.bag-boston.test)^2)

# We could change the number of trees grown by randomForest() using the ntree argument:
bag.boston=randomForest(medv~.,data=Boston,subset=train, mtry=13,ntree=25)
yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
mean((yhat.bag-boston.test)^2)

#Random Forest
#By default, randomForest() uses p/3 variables when building a random forest of regression trees, and √p variables when building a random forest of classification trees.
set.seed (1)
rf.boston=randomForest(medv~.,data=Boston,subset=train,mtry=6,importance =TRUE)
yhat.rf = predict(rf.boston ,newdata=Boston[-train ,])
mean((yhat.rf-boston.test)^2)
importance (rf.boston)
varImpPlot (rf.boston)

#Boosting
library(gbm)
set.seed(1)
boost.boston=gbm(medv~.,data=Boston[train,],distribution="gaussian",n.trees=5000, interaction.depth=4)
summary(boost.boston)
# We see that lstat and rm are by far the most important variables.
par(mfrow=c(1,2)) 
plot(boost.boston ,i="rm")
plot(boost.boston ,i="lstat")
yhat.boost=predict(boost.boston,newdata=Boston[-train,], n.trees=5000)
mean((yhat.boost -boston.test)^2)

# The default value is 0.001, but this is easily modified. Here we take λ = 0.2.
boost.boston=gbm(medv~.,data=Boston[train,],distribution= "gaussian",n.trees=5000, interaction.depth=4,shrinkage =0.2, verbose =F)
yhat.boost=predict(boost.boston,newdata=Boston[-train,], n.trees=5000)
mean((yhat.boost -boston.test)^2)




