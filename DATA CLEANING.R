library(rvest)
library(dplyr)
imdb.rating <- read.csv("My_movie data.csv")
View(imdb.rating)
imdb.rating$year <- gsub("[-]","",imdb.rating$year)
View(imdb.rating)
imdb.rating$duration <- gsub("min","",imdb.rating$duration)
View(imdb.rating)
str(imdb.rating)
imdb.rating$name <- as.character(imdb.rating$name)
imdb.rating$duration <- as.integer(imdb.rating$duration)
imdb.rating$rating <- as.numeric(imdb.rating$rating)
imdb.rating$year <- as.numeric(imdb.rating$year)
View(imdb.rating)
str(imdb.rating)
set.seed(123)
imdb.rating$gross_dollars <- runif(50,min = 10000000,max = 1000000000)
imdb.rating$gross <-runif(50,min = 10000000,max = 1000000000)
View(imdb.rating)
imdb.rating <- subset(imdb.rating,select = -(gross_dollars))
View(imdb.rating)
imdb.rating$rank <- c(1:50)
View(imdb.rating)
imdb.rating <- imdb.rating[c("rank","name","year","rating","duration","gross")]
View(imdb.rating)


View(imdb.rating)
imdb.rating[1,6] <- NA
imdb.rating[18,6] <-NA
imdb.rating[36,6] <-NA
imdb.rating[45,6] <-NA
View(imdb.rating)
imdb.ratings$gross_dollars =ifelse(is.na(imdb.rating$gross_dollars),
                                  ave(imdb.rating$gross_dollars,
                                      FUN= function(x)
                                        mean(x,na.rm=TRUE)),
                                  imdb.rating$gross_dollars)
view(imdb.rating)
imdb.rating$watch_list <- imdb.rating$rating > 8.6
View(imdb.rating)
str(imdb.rating)
imdb.rating$watch_list= as.factor(imdb.rating$watch_list)
str(imdb.rating)


imdb.rating$watchlist_list = factor(imdb.rating$watch_list,
                                    level = c('TRUE','FALSE'),
                                    lable = c(1,0))
View(imdb.rating)

library(caTools)
split =sample.split(imdb.rating$gross_dollars,
                    SplitRatio = 0.8)
training_set=subset(imdb.rating,split== TRUE)
testing_set=subset(imdb.rating,split== FALSE)
View(training_set)
View((testing_set)
     
install.packages("outliers")
library(outliers)
test <- grubbs.test(imdb.rating$gross_dollars)
traning_set$scaled_gross=scale(training_set[,6])
View(training_set)
testing_set$scaled_gross<-scale(testing_set[,6])
view(testing_set)

            