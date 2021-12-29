library(ggplot2)
library(tidyverse)

raw_data <- read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\netflix_titles.csv")
colnames(raw_data)
dim(raw_data)
head(raw_data$rating)


##plot Distribution of Content Ratings on Netflix
plot_data <-plyr::count(raw_data$rating)
plot_data

ggplot(plot_data, aes(x="",y = freq,fill = x)) +
  geom_bar(width=1,stat = "identity",color= "white") +
  coord_polar("y",start=0)

##Top 5 Actors and Directors


#removing empty strings values

 filterd_data <-raw_data %>% 
  mutate(director = strsplit(as.character(director), ", ")) %>%
  unnest(director)

 
 plot_data2 <-plyr::count(filterd_data $director)
plotdata2 <-plot_data2 %>% arrange(desc(freq)) %>% head(5) %>% arrange(desc(freq))


 ggplot(plotdata2,aes(x=reorder(x, freq),y =freq))+
   geom_bar(stat = "identity")+
   labs(x = "Directors")+
   coord_flip()
 
 ##Top 5 Actors on Netflix
 filterd_data <-raw_data %>% 
   mutate(cast = strsplit(as.character(cast), ", ")) %>%
   unnest(cast)
 
 
 plot_data2 <-plyr::count(filterd_data $cast)
 plotdata2 <-plot_data2 %>% arrange(desc(freq)) %>% head(5) %>% arrange(desc(freq))
 
 
 ggplot(plotdata2,aes(x=reorder(x, freq),y =freq))+
   geom_bar(stat = "identity")+
   labs(x = "Actors")+
   coord_flip()
   
 