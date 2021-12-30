library(ggplot2)
library(tidyverse)

raw_data <- read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\netflix_titles.csv")

##plot Distribution of Content Ratings on Netflix
plot_data <-plyr::count(raw_data$rating)

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
   
##Trend of content produced over the years on Netflix
plot_data3<-raw_data %>% 
   group_by(type,release_year) %>%
    summarise(count =n()) 

ggplot()+
  geom_line(data = plot_data3 %>% filter(type=="Movie" & release_year >=2010 ),aes(release_year,count,col = 'Movie'))+
  geom_line(data = plot_data3 %>% filter(type=="TV Show" &  release_year >=2010),aes(release_year,count,col = 'TV Show'))
 



 