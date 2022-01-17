library("twitteR")

data <- read.csv("C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/twitter.csv")

text <- tolower(data$tweet)
text <- gsub('[[:punct:]]', '',text)


