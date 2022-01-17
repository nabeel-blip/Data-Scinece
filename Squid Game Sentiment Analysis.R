install.packages('SnowballC')
install.packages('SentimentAnalysis')
library(SentimentAnalysis)
library(ggplot2)
library(tidyverse)
library(dplyr)
library(wordcloud2)
library(wordcloud)
library(RColorBrewer)
library(tm)
raw_data<-read.csv('C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/squidgame.csv')
data<-select(raw_data, -user_description,-user_location) 
data<-data[c(0:2000),]

text<-data$text
docs <-  VCorpus(x = VectorSource(text),
                 readerControl = list(reader=readPlain,
                                      language="en"))
docs <- docs %>%
  tm_map(removeNumbers) %>%
  tm_map(removePunctuation) %>%
  tm_map(stripWhitespace)
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeWords, stopwords("english"))

dtm <- TermDocumentMatrix(docs) 
matrix <- as.matrix(dtm) 
words <- sort(rowSums(matrix),decreasing=TRUE) 
df <- data.frame(word = names(words),freq=words)

set.seed(1234)

wordcloud(words = df$word, freq = df$freq, min.freq = 1,max.words=800, random.order=FALSE, rot.per=0.35,colors=brewer.pal(8, "Dark2"))




