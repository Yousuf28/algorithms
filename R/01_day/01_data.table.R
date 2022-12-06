library(data.table)
# read in data provided
DT <- fread("input01.txt", header = FALSE, col.names = "calories")

# part 1
# create an elf id to group by
DT[, id.elf := rleid(is.na(calories))]
# calculate sum
max(DT[!is.na(calories), .(total = sum(calories)), by = .(id.elf)]$total)
#[1] 67633

# part 2
# order the data.table with summed totala in decreasing order
DT.sum <- DT[!is.na(calories), .(total = sum(calories)), by = .(id.elf)]
# take the top 3, and sum
sum(DT.sum[order(total, decreasing = TRUE), total[1:3]])
# [1] 199628

