install.packages("gtrendsR")
install.packages("reader")
install.packages("readr")
install.packages("tidyverse")
install.packages("rwhatsapp")
library(rwhatsapp)
library(tidyverse)
ibrary("readr")
library("reader")
library(gtrendsR)

orignal <- gtrends(keyword = "Machine Learning")


data <- orignal[["interest_by_country"]];
newdata <- data[order(data$hits,decreasing = TRUE),]
newdata <- head(newdata)
ggplot(newdata,aes(location, hits,fill = as.factor(location)))+
  geom_bar(stat="identity")


interest_over_time <-orignal[["interest_over_time"]];
ggplot(interest_over_time,aes(date,hits) )+
  geom_line()


