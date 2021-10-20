#setwd("C:\Users\joeljohn\Desktop\Bioinformatics-Project")

rm(Data)
Data <- read.csv("Data/FinalTable.csv")
colnames(Data)[1] <- gsub('^...','',colnames(Data)[1])
Data <- Data[1:5000,]
Data <- Data[c(1:5, 15, 21)]
Data <- Data[order(Data$Variance, decreasing = TRUE),][1:5000,]
Data <- Data[-c(6)]
row.names(Data) <- NULL

install.packages(c("cluster", "factoextra"))
library(cluster)
library(factoextra)
pamResult <- pam(Data, k=2)
Data$cluster = pamResult$cluster

head(Data)
pamResult$medoids
pamResult$clustering

fviz_cluster(pamResult, 
             +              palette =c("#007892","#D9455F"),
             +              ellipse.type ="euclid",
             +              repel =TRUE,
             +              ggtheme =theme_minimal())