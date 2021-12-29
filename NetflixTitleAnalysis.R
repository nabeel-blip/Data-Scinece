library(ggplot2)
library(tidyverse)

raw_data <- read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\netflix_titles.csv")
colnames(raw_data)
dim(raw_data)
head(raw_data$rating)


#plot Distribution of Content Ratings on Netflix
plot_data <-plyr::count(raw_data$rating)
plot_data

ggplot(plot_data, aes(x="",y = freq,fill = x)) +
  geom_bar(width=1,stat = "identity",color= "white") +
  coord_polar("y",start=0)


