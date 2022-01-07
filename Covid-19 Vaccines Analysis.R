library(lubridate)
library(plyr)
library(tidyverse)

#reading data
raw_data<-read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\country_vaccinations.csv")

raw_data$date <- mdy_hms(raw_data$date)

# removing error while recording this data/dupliction in city and country count
countries = c('England','Northern Ireland','Scotland','Wales')
data <- raw_data %>%
  filter (!country %in% countries) 
colnames(data)
df <- data[c("country","vaccines")]
df <-(unique(df))

some.eu.maps <- map_data("world", region = unique(data$country))

region.lab.data <- some.eu.maps %>%
  group_by(region) %>%
  summarise(long = mean(long), lat = mean(lat))

some.eu.maps["vaccine"] <- NA
combined <- full_join(some.eu.maps, df, by = c("region"= "country"))   
colnames(some.eu.maps)
ggplot(combined, aes(x = long, y = lat)) +
  geom_polygon(aes( group = group, fill = factor(vaccines)))+
  theme(legend.position = "none")  

