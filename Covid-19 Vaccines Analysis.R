library(lubridate)
library(plyr)



#reading data
raw_data<-read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\country_vaccinations.csv")

raw_data$date <- mdy_hms(raw_data$date)

# removing error while recording this data/dupliction in city and country count
countries = c('England','Northern Ireland','Scotland','Wales')
data <- raw_data %>%
  filter (!country %in% countries) 

colnames(data)
View(plyr::count(data$vaccines))


