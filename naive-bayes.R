data<-read.csv("formability.csv",FALSE,",")
View(data)
table(data$V1)
data$V1<-as.factor(data$V1)
data_s<-sample(2,nrow(data), replace=TRUE, prob=c(0.67,0.33))

trainD<-data[data_s==1,]
testD<- data[data_s==2,] 
nrow(test)
library(e1071)
library(rminer)
e1071model<-naiveBayes(V1~.,data=trainD)
e1071model
#prediction Model
e1071prediction<-predict(e1071model,testD)
mmetric(testD$V1,e1071prediction,c("ACC","PRECISION","TPR","F1"))

