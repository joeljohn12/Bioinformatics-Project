library(DESeq2)
library(ggplot2)
library(magrittr)

coldata <- read.csv("col_metadata.csv", row.names = 1)
colnames(coldata)[1] <- gsub('^...','',colnames(coldata)[1])

countData <- read.csv("FinalTable.csv", row.names = 19)
countData <- countData[-c(1, 6:7, 12:41)]

dds <- DESeqDataSetFromMatrix(countData = round(countData),
                              colData = coldata,
                              design = ~ Type)
