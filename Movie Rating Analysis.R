
library(dplyr)


raw_data_movie <- read.csv("C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/Movie Rating data/movies.dat", sep=':')
raw_data_movie <-select(raw_data_movie,-X,-X.1)


colnames(raw_data_movie ) <- c("ID","Title","Genre")

raw_data_movie $ID <- as.numeric(raw_data_movie $ID)

View(raw_data_movie )

raw_data_ratings <- read.csv("C:/Users/Nabeel Hassan Khan/Desktop/Rstudio/Data Scinece assginments/Movie Rating data/ratings.dat", sep=':')
raw_data_ratings <-select(raw_data_ratings,-X,-X.1,-X.2)

colnames(raw_data_ratings ) <- c("User", "ID", "Ratings", "Timestamp")
typeof(raw_data_ratings$ID)
data <- left_join(raw_data_movie, raw_data_ratings, by = c("ID"= "ID"))   

 