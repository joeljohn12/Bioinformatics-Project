options(max.print=999999)
%display the table in R
RTable=read.table("DataReplaced1.txt", header = TRUE, sep = "\t", comment.char="%")
%turn the data into a readable table i.e.data frames
RTable
%display the table
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
%type these to use the plot function
plot(density(RTable$REF_ID))
