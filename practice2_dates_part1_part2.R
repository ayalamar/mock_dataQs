## PART 1
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

## PART 2
#Given this file, can you create a cumulative distribution chart of the total 
#years worked across all employees surveyed? You can exclude values that
#indicate the employee did not state his/her start or end date.

library(ggplot2)
# Total years worked = Cease Date Year - DETE Start Date Year
dete$Cease.Date.New[which(dete$Cease.Date.New == 0)] <- NA
dete$Cease.Date.New <- as.numeric(dete$Cease.Date.New)

dete$DETE.Start.Date[which(dete$DETE.Start.Date == "Not Stated")] <- NA
dete$total_years_worked <- dete$Cease.Date.New - as.numeric(as.character(dete$DETE.Start.Date))

ggplot(dete,aes(x=total_years_worked)) +
  stat_bin(data=dete,aes(y=cumsum(..count..)),geom="step") +
  xlab("Total # of years worked") +
  ylab("Cumulative sum of workers")