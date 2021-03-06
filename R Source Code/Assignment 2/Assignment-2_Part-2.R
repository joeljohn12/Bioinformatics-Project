library(DESeq2)
library(ggplot2)
library(magrittr)
library(umap)

coldata <- read.csv("col_metadata.csv", row.names = 1)

countData <- read.csv("FinalTable.csv", row.names = 19)
countData <- countData[-c(1, 6:7, 12:41)]

dds <- DESeqDataSetFromMatrix(countData = round(countData),
                              colData = coldata,
                              design = ~ Type)
vsd <- vst(dds, blind=FALSE)
plotPCA(vsd, intgroup = c("Type"))
art = umap.UMAP().fit(countData)
umap.plot.points(art, coldata)
