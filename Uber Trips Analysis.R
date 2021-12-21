install.packages("lubridate")

library(lubridate)

#####data import and cleaning #####
raw_data <-read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\uber-raw-data-apr14.csv")

raw_data <- head(raw_data,100)
dput(raw_data)
?factor
##trying to read data way one 
new_cols<- data.frame()
temp <-as.POSIXct(raw_data$Date.Time,format = "%d/%m/%Y %H:%M:%S")
new_cols <- data.frame(day =day(temp),hour = hour(temp),weekday = format(temp,format = "%u"))



