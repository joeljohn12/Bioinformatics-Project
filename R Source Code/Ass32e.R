install.packages("ggalluvial")
library(ggalluvial)
library(DESeq2)
library(ggplot2)
library(dplyr)
countData1<-read.csv("2ehclust.csv")
ggplot(as.data.frame(countData1), aes(y=X,
axis1 = X10, axis2 = X100, axis3 = X1000, axis4 = X10000)) +
  geom_alluvium() +
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
  scale_fill_brewer(type = "qual", palette = "Set1") +
  ggtitle("Cluster Amounts")
