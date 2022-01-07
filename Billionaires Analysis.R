library(stringr)
library(ggplot2)
library(dplyr)

raw_data<-read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\Billionaire.csv")
colnames(raw_data)


#checking for NA values
summary(raw_data)
summary(data)
test <-head(raw_data)

raw_data$NetWorth<-gsub('$','',raw_data$NetWorth,fixed = TRUE)
raw_data$NetWorth<-gsub(' B','',raw_data$NetWorth)  

typeof(test$NetWorth)

raw_data$NetWorth
data <- raw_data
data$NetWorth <- as.numeric(as.character(raw_data$NetWorth))
plot_data<- arrange(data,NetWorth,)
colnames(plot_data)
plot_data <- head(data[order(-data$NetWorth),],10)
summary(plot_data)
ggplot(plot_data,aes(x=reorder(Name,-NetWorth),fill= NetWorth))+
  geom_bar()

