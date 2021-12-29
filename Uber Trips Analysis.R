install.packages("lubridate")
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)

#####data import and cleaning #####
raw_data <-read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\uber-raw-data-apr14.csv")

##trying to read data way one 
new_cols<- data.frame()
temp <-as.POSIXct(raw_data$Date.Time,format = "%m/%d/%Y %H:%M:%S")
new_cols <- data.frame(day =day(temp),hour = hour(temp),weekday = format(temp,format = "%u"))

##
ggplot (new_cols,aes(day))+
  geom_bar( stat = "count")

##
ggplot (new_cols,aes(hour))+
  geom_bar( stat = "count")

##
ggplot (new_cols,aes(weekday))+
  geom_bar( stat = "count")

##
heatmap_data<-new_cols %>% 
  group_by(hour,weekday) %>%
  summarise(number = n())
##
ggplot(heatmap_data, aes(hour, weekday, fill= number)) + 
  geom_tile() 


##
sampled_rows_No <-sample(1:nrow(raw_data),10000)

ggplot(raw_data[sampled_rows_No,],aes(Lon,Lon))+
  geom_point(alpha = 0.4)

#geom_hex()


