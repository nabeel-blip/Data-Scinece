
library(dplyr)
library(plyr)
library(ggplot2)

raw_data_movie <- read.csv("C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/Movie Rating data/movies.dat", sep=':')
raw_data_movie <-select(raw_data_movie,-X,-X.1)
colnames(raw_data_movie ) <- c("ID","Title","Genre")
raw_data_movie $ID <- as.numeric(raw_data_movie $ID)


raw_data_ratings <- read.csv("C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/Movie Rating data/ratings.dat", sep=':')
raw_data_ratings <-select(raw_data_ratings,-X,-X.1,-X.2)
colnames(raw_data_ratings ) <- c("User", "ID", "Ratings", "Timestamp")


data <- left_join(raw_data_movie, raw_data_ratings, by = c("ID"= "ID"))   
plot_data <-plyr::count(data$Ratings,vars =NULL)
plot_data <-plot_data[-c(12),]

ggplot(plot_data, aes(x="", y=freq, fill=factor(x))) +
  geom_bar(stat="identity", width=1,col = "White") +
  coord_polar("y", start=0)+
  theme_void()+
  geom_text(aes(label = x),position = position_stack(vjust = 0.5))+
  scale_fill_discrete(name = "Rating")
  
  

