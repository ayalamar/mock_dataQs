library(dplyr)
library(tidyr)

X = c(1,2,3,4,5,6,4,3,2,3)
Y = c("?","ok","good","?","ok","good","?","ok","good","?" )
XYdf <- cbind(X,Y)
colnames(XYdf) <- c("Xval", "Yval")
# normalizing
# X_z = ((X - mean(X))/sd(X))

# are there missing values?
lapply(XYdf, function(x){any(x == "?")})

# count up how many missing values
for (col in colnames(XYdf)){
  if(is.character(XYdf[,col])){
    count = sum(ifelse(XYdf[,col] == "?", 1, 0))
    cat(paste(col, as.character(count), '\n'))
  }
}

# remove rows with missing values
cols = "Yval"
XYdf[,cols] = sapply(XYdf[,cols], function(x){ifelse(x =="?", NA, x)})
# XYdf = XYdf[complete.cases(XYdf[,cols]),] 
XYdf <- XYdf %>% tbl_df %>%  drop_na(Yval) # same as above
