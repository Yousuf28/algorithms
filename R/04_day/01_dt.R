library(data.table)
DT <- fread("day04.txt", header = FALSE, col.names = c("task1", "task2"))
DT
# part 1
# split columns
DT[, c("from1", "to1") := lapply(tstrsplit(task1, "-"), as.numeric)]
DT[, c("from2", "to2") := lapply(tstrsplit(task2, "-"), as.numeric)]
DT
# find and count overlaps
nrow(DT[(from1 >= from2 & to1 <= to2) | from2 >= from1 & to2 <= to1, ])
# 453

# part 2
nrow(DT[(to1 >= from2 & from1 <= to2) | (to2 >= from1 & from2 <= to1), ])


dt <- DT[1:10]
dt[(from1 >= from2 & to1 <= to2) | from2 >= from1 & to2 <= to1, ]

crate a shiny app to visualize the data 