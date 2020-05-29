library(tree)
library(ISLR)
Carseats
attach(Carseats)
High=ifelse(Sales <=8,"No","Yes")
#Carseats =data.frame(Carseats ,High)
tree.carseats =tree(High~.-Sales ,Carseats )
summary(tree.carseats)
plot(tree.carseats )
text(tree.carseats ,pretty =0)
tree.carseats
set.seed (2)
train=sample(1:nrow(Carseats), 200)
Carseats.test=Carseats [-train ,]
High.test=High[-train]
tree.carseats=tree(High~.-Sales,Carseats,subset=train)
tree.pred=predict(tree.carseats,Carseats.test,type="class")
table(tree.pred,High.test)
(86+57)/200

#pruning the tree might lead to improved results
set.seed (3)
cv.carseats =cv.tree(tree.carseats ,FUN=prune.misclass )
names(cv.carseats )
cv.carseats
par(mfrow=c(1,2))
plot(cv.carseats$size ,cv.carseats$dev ,type="b")
plot(cv.carseats$k ,cv.carseats$dev ,type="b")

#to prune the tree to obtain the nine-node tree.
prune.carseats=prune.misclass(tree.carseats,best=9)
plot(prune.carseats )
text(prune.carseats,pretty=0)
tree.pred=predict(prune.carseats,Carseats.test,type="class")
table(tree.pred ,High.test)
(94+60) /200

# If we increase the value of best, we obtain a larger pruned tree with lower classification accuracy:
prune.carseats=prune.misclass(tree.carseats,best=15)
plot(prune.carseats )
text(prune.carseats,pretty=0)
tree.pred=predict(prune.carseats,Carseats.test,type="class")
table(tree.pred ,High.test)