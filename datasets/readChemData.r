#read in chemical.txt
chemData <- read.table("chemical.txt", sep = " ", header = TRUE)

#or with a package
library(readr)
chemData <- read_table2("chemical.txt")
