# splitting strings
df <- read.csv("data/PhoneData.csv", header = TRUE)

# split characters on comma
df <- data.frame(x = unlist(strsplit(as.character(df$x), ",")))

# format into columns
df <- matrix(df$x, nrow = 1000, ncol = 3, byrow = TRUE)
