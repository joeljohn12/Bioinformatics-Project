library(DESeq2)
library(ggplot2)
library(dplyr)
countData<-read.csv("FinalTable.csv")
countData<-countData[c(1:15)]
countData<-countData[order(countData$Variance, decreasing = TRUE),][1:5000,]
countData<-countData[c(2,4)]
x<-data.matrix(countData, rownames.force=TRUE)
heatmap(x, main="Heamap with hclust")
write.csv(x, "33v2.csv")