# write code to put the Cease Date column into YYYY format. 
# You'll notice the column is currently in a mix of various formats.

library(stringr)

dete <- read.csv("data/dete-exit-survey-january-2014.csv", header=TRUE)

dete$Cease.Date <- as.character(dete$Cease.Date)
CD <- unique(dete$Cease.Date)

dete$Cease.Date.New <- NA

for (odidx in 1:(length(dete$Cease.Date))){
  if (dete$Cease.Date[odidx] == "Not Stated"){
    dete$Cease.Date.New[odidx] <- "0"
  } else {
    dete$Cease.Date.New[odidx] <- str_sub(dete$Cease.Date[odidx],
                                          start=nchar(dete$Cease.Date[odidx])-3,
                                          end=nchar(dete$Cease.Date[odidx]))
  }
}
unique(dete$Cease.Date.New)
