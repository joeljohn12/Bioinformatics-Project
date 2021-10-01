library(gprofiler2)
full <- read.csv("FinalTable.csv")

stresbal <- gost(full$Symbol, organism="hsapiens")
stres_result <- head(stresbal$result, 15)

