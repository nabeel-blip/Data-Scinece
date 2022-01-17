library("twitteR")

data <- read.csv("C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/twitter.csv")

text <- tolower(data$tweet)
text <- gsub('[[:punct:]]', '',text)


sentimentanalysis<-analyzeSentiment(text)
newdata$Sentiment_Score<-sentimentanalysis$SentimentQDAP
newdata$Sentiment<-convertToDirection(sentimentanalysis$SentimentQDAP)
Positive= sum(newdata$Sentiment=='positive')
Negative= sum(newdata$Sentiment=='negative')
Neutral<-sum(newdata$Sentiment=="neutral")
paste("Positive: ",Positive)
paste("Negative: ",Negative)
paste("Neutral:  ",Neutral)

