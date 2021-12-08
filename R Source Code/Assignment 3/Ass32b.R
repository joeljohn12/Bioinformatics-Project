library(DESeq2)
library(ggplot2)
library(dplyr)
countData<-read.csv("FinalTable.csv")
countData<-countData[c(1,15)]
countData<-countData[order(countData$Variance, decreasing = TRUE),][1:5000,]
seeds_label<-countData$X
countData$ X <- NULL
countDatasc<-as.data.frame(scale(countData))
dist_mat<-dist(countData, method = 'euclidean')
hclust_avg <- hclust(dist_mat, method = 'average')
plot(hclust_avg)
cut_avg<-cutree(hclust_avg, k=10)
rect.hclust(hclust_avg, k=10, border = 2:6)
abline(h=10, col = 'red')
seeds_df_cl<-mutate(countData, cluster=cut_avg)
count(seeds_df_cl,cluster)