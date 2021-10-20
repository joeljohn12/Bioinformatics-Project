#install.packages("mclust")
#setwd("C:\\Users\\asus\\Documents\\2021 Fall\\Bioinformatics\\Bioinformatics-Project")
library(mclust)

rm(Data)
Data <- read.csv("Data/FinalTable.csv")
colnames(Data)[1] <- gsub('^...','',colnames(Data)[1])
Data <- Data[1:5000,]
Data <- Data[c(1:5, 15, 21)]
Data <- Data[order(Data$Variance, decreasing = TRUE),][1:5000,]
Data <- Data[-c(6)]
rm(ClData)
row.names(Data) <- NULL

ClData <- Data[c(2, 4)]

row.names(ClData) <- Data[c(6)]
ClClass <- Data$ILMN_Gene
clPairs(ClData, ClClass)
