#install.packages("mclust")
#setwd("C:\\Users\\asus\\Documents\\2021 Fall\\Bioinformatics\\Bioinformatics-Project")
library(mclust)
library(ggalluvial)

full_Data <- read.csv("Data/FinalTable.csv")
colnames(full_Data)[1] <- gsub('^...','',colnames(full_Data)[1])

Data <- full_Data
Data <- Data[c(1:5, 15, 21)]
Data <- Data[order(Data$Variance, decreasing = TRUE),][1:5000,]
Data <- Data[-c(6)]

row.names(Data) <- NULL

ClData <- Data[c(2, 4)]
mod <- Mclust(ClData)
plot(mod, what = "classification")
summary(mod)

Clten <- ClData[1:10,]
mood <- Mclust(Clten)
plot(mood, what = "classification")
summary(mood)


Clhunna <- ClData[1:100,]
moood <- Mclust(Clhunna)
plot(moood, what = "classification")
summary(moood)

Clthou <- ClData[1:1000,]
mooood <- Mclust(Clthou)
plot(mooood, what = "classification")
summary(mooood)


Cltenthou <- full_Data[c(2, 4)][1:10000,]
moooood <- Mclust(Cltenthou)
plot(moooood, what = "classification")
summary(moooood)


plotData <- read.csv("Data/2eGMM.csv")
ggplot(as.data.frame(plotData), aes(y=X,
                                      axis1 = X10, axis2 = X100, axis3 = X1000, axis4 = X10000)) +
  geom_alluvium() +
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
  scale_fill_brewer(type = "qual", palette = "Set1") +
  ggtitle("Cluster Amounts")
