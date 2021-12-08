library(DESeq2)
library(ggplot2)
library(lattice)
library(dplyr)
countData<-read.csv("4d.csv")
seeds_label<-countData$X
countData$ X <- NULL
splom(~countData)