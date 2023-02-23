install.packages("remotes")
install.packages("PKS")
library(rvest)
library(dplyr)
link <-'https://www.icc-cricket.com/rankings/mens/player-rankings/test/batting'
# allowability
web <-read_html(link)
cricketer_name <- web %>% html_nodes (".rankings-block__banner--name-large , .name a") %>% html_text()
View(cricketer_name)
cricket_team<- web %>% html_nodes (".rankings-block__banner--nationality , .table-body__logo-text") %>% html_text()
View(circket_team)
ratings <- web %>% html_nodes (".rankings-block__banner--rating , .rating") %>% html_text()
View(ratings)
mens_batting_rate <- data.frame(cricketer_name, cricket_team, ratings)
View(mens_batting_rate)
write.csv(mens_batting_rate, 'cricket team dataset')

