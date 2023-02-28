library(ggplot2)
library(dplyr)
expenses <- read.csv("dailyexpenses.csv")
View(expenses)
str(expenses)
expenses$Data <- as.Date(expenses$Date,"%d/%m/%y")
View(expenses)
tot <- expenses[,2:9]
total <- colSums(tot)
detail <- c("food","groceries","medical","fuel","toll","phone","electricity","miscellaneous")
tot_each <- data.frame(detail,total)
View(tot_each)
ggplot(data = tot_each,aes(x= detail,y = total))+
  geom_bar(stat = "identity",fill = "blue")+
  labs(x = "Items",y = "Expenses",title = "Comparing Expenses")
cm <- expenses[,2:9]
dt <- expenses[,1]
rs <- rowSums(cm)
dt <- as.Date(dt)
str(dt)
daily_tot <- data.frame(dt, rs)
View(daily_tot)
 ggplot(data = daily_tot, aes(x = dt , y = rs))+
   geom_line(color = "Red", size = 2)+labs(x = "Data", y = "Expenses" , title = "Total  Expenses")

 md <- expenses[, 3]
 de <- expenses[, 1]
 str(md)
 de = as.Date(de)
 md = as.numeric(md)
 daily_med <- data.frame(de,md)
 View(daily_med)
  ggplot(data = daily_med, aes(x=de, y=md))+ geom_point()+
    labs(x = "Expenses", y = "Medical", title = "Medical Expenses")
  
  ggplot(expenses,aes(x=Medical))+
    geom_histogram(binwidth = 5,color ="red",fill="blue")
  
  pc <- read.csv("piechart.csv")
  View(pc)
  pie <- ggplot(pc,aes(x="",y=amount,fill= factor(expences)))+
    geom_bar(width = 1 ,stat ="identity")+
    theme(axis.line = element_blank(),
          plot.title = element_text(hjust = 0.5))+
    labs(fill="expense",x = NULL, Y = NULL, title = "pie chart of expenses")
  pie + coord_polar(theta = "y",start=0)

   