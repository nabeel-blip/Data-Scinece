install.packages("dplyr")
install.packages("ggplot2")

library(ggpolt2)
library(dplyr)

#####data import and cleaning #####
raw_data <- read.csv("C:\\Users\\Nabeel Hassan Khan\\Desktop\\Rstudio\\Data Scinece assginments\\water_potability.csv")

summary(raw_data)
colnames(raw_data)

##removing NAs

data <- raw_data[complete.cases(raw_data),]


## imbalance of Potability
ggplot2::ggplot(data,aes(Potability))+
  ggplot2::geom_bar()


##
ggplot(data,aes(ph , fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)


##
ggplot(data,aes( Hardness, fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)

##
ggplot(data,aes(Chloramines , fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)

##
ggplot(data,aes(Sulfate, fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)

##
ggplot(data,aes( Conductivity, fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)

##
ggplot(data,aes( Organic_carbon, fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)

##
ggplot(data,aes( Trihalomethanes, fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)

##
ggplot(data,aes( Turbidity, fill  = factor(Potability)))+
  geom_histogram(position = "identity", alpha = 0.2, bins = 50)



