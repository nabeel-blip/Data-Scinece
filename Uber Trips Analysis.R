install.packages("lubridate")

library(lubridate)

#####data import and cleaning #####
raw_data <-read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\uber-raw-data-apr14.csv")

raw_data <- head(raw_data,100000)

##trying to read data way one 
test <- head(raw_data)
test[,"Date.Time"][2]
pb = txtProgressBar(min = 0, max = nrow(raw_data), initial = 0) 
new_cols<- data.frame()
for (i in 1:nrow(raw_data)){
  setTxtProgressBar(pb,i)
  temp <-as.POSIXct(raw_data[,"Date.Time"][i],format = "%d/%m/%Y %H:%M:%S")
  new_cols<- rbind(new_cols,c(day(temp),format(temp,format = "%u"),hour(temp)))
}

close(pb)
names(new_cols) <- c("day","weekday","hour")

data<-cbind(raw_data,new_cols)
 
nrow(raw_data)

##trying to read data way two
new_cols<- data.frame()
temp <-as.POSIXct(raw_data[,"Date.Time"],format = "%d/%m/%Y %H:%M:%S")
new_cols<- rbind(c(day(temp),format(temp,format = "%u"),hour(temp)))




