install.packages("wordcloud") 
library(wordcloud)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("wordcloud2")
library(wordcloud2)
install.packages("tm")
library(tm)
install.packages("dplyr")


data  <-rwa_read("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Assignments\\chat.txt")

keeps <-c("time","author","text","emoji","emoji_name")

colnames(data)

final_form <- data[keeps]

smiley_without_na <- final_form[!(is.na(final_form$emoji) | final_form$emoji=="NULL") ,] 

keep <- c("author","emoji")

smiley_data <- smiley_without_na[keep]

data_smilie <- data.frame(matrix(
  vector(), 0, 2, dimnames=list(c(), c("author","emoji"))),
  stringsAsFactors=F)


for (i in 1:509) {
  name = as.character(smiley_data[i,1])
  temp = unlist(smiley_data[i,2]) 
  for(j in temp){
    data_smilie[nrow(data_smilie) + 1,] = c(name,j)
  }
}

colnames()

?count(data_smilie)

ggplot(plyr::count(data_smilie,"author"), aes(x=author,y = freq,fill = author))+ 
  geom_bar(stat="identity")

ggplot(data_smilie, aes(x=factor(author),fill = emoji))+ 
  geom_bar()+
  coord_polar("y", start=0)


########################


colnames(data)

#Create a vector containing only the text


mid <-data %>% filter(author=="D")
# Create a corpus  
mid <- mid %>% filter(text !="<Media omitted>" )
text<- mid %>% select(text)

docs <- Corpus(VectorSource(text))

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

xset.seed(1234) # for reproducibility 
wordcloud(words = df$word, freq = df$freq, min.freq = 1,   scale=c(3.5,0.25),        max.words=300, random.order=FALSE, rot.per=0.35,            colors=brewer.pal(8, "Dark2"))

######################


#numer of msg's
nrow(data)
#number of media shared
nrow(data %>% filter(text == "<Media omitted>"))
#number of emoji's shared 
nrow(data_smilie) # from emoji analsis 

################3###

authors <-  as.character(unique(data$author))

authors <- authors[0:3]


for(i in authors ){
  users_data<-data %>% filter(author == i)
  sum = 0
  for (j in users_data$text){
    sum = sum+ sapply( strsplit(j, " ") , length)
    
  }
  print(i)
  print(paste("total msgs",nrow(users_data)))
  avrage <- sum / nrow(users_data)
  print(paste("avg word per msg",avrage))
  print(paste("Media msgs",nrow(users_data %>% filter(text == "<Media omitted>"))))
  print(paste("emoji's sent",nrow(data_smilie %>% filter(author == i))))
  
  
}