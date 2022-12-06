
## Read input


input <- scan(file = "input01.txt", what = integer(), blank.lines.skip = FALSE)
data <- split(input, cumsum(is.na(input)))
data <- sapply(data, \(x) sum(x,na.rm = TRUE))


## Part 1


max(data)


## Part 2


sum(sort(data, decreasing = TRUE)[1:3])
