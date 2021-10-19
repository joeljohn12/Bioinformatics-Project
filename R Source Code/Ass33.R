library(DESeq2)
library(ggplot2)
library(dplyr)
countData<-read.csv("FinalTable.csv")
countData<-countData[c[1:15]]
countData<-countData[order(countData$Variance, decreasing = TRUE),][1:5000,]
countData<-countData[c(2,3,4,5)]
x<-data.matrix(countData, rownames.force=TRUE)
heatmap(x, main="Heamap with hclust")
write.csv(x, "33.csv")