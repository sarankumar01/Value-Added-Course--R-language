dataset = read.csv("Admission_predict.csv")
View(dataset)
str(dataset)
gre = dataset[,2]
coa = dataset[,9]
data = data.frame(gre,coa)
View(data)
library(caTools)
set.seed(42)
split=sample.split(data$coa,SplitRatio = 0.8)
training_set=subset(data,split==TRUE)
View(training_set)
testing_set=subset(data,split==FALSE)
View(testing_set)
regressor=lm(formula = coa~gre,data=training_set)
y_pred=predict(regressor,newdata=testing_set)
View(y_pred)
library(ggplot2)
plot(testing_set$gre,testing$coa,type='p',col='blue',xlab='GRE',ylab='COA')
lines(testing_set$gre,y_pred,type='o',col='red')
ggplot(testing_set, aes(x=gre))+
  geom_point(aes(y=coa,color='Actual'))+
  geom_line(aes(y=y_pred,color='Predicted'))
