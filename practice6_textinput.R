# Write a function that can take in a text file 
#and return the number of characters in the file categorized by:
## alphabetic, numeric, other non space characters

library(tidyverse)
filename = "data/test.txt"

text_counter <- function(filename){
  
  temp_file <- read.delim(filename, header = FALSE, stringsAsFactors = F)

  seps <- NA
  for (line_no in 1:length(temp_file$V1)){
    sep_line <- strsplit(temp_file$V1[line_no], "")
    if (is.na(seps)){
      seps <- sep_line
    } else {
      seps <- c(seps, sep_line)
    }
  }
  
  counter_letters = 0 # set the counters 
  counter_numbers = 0
  counter_space = 0
  counter_others = 0
  
  for (line_no in 1:length(seps)){
    
    # count the alphabetical characters
    for (i in 97:122){
      counter_letters_n = length(grep(intToUtf8(i), seps[[line_no]], ignore.case = TRUE))
      counter_letters = counter_letters + counter_letters_n
    }
    
    # count the numeric characters
    for (j in c("0","1","2","3","4","5","6","7","8","9")){
      counter_numbers_n = length(grep(j, seps[[line_no]]))
        counter_numbers = counter_numbers + counter_numbers_n
    }
    
    # count the spaces
    counter_space_n = length(grep(" ", seps[[line_no]]))
    counter_space = counter_space + counter_space_n
    
  }

total_chars <- map(seps, nchar)
total_chars <- sum(map_dbl(total_chars,sum))
counter_other = total_chars - counter_letters - counter_numbers - counter_space

# sprintf("there are %d alphabetical characters", counter_letters)
# sprintf("there are %d numerical characters", counter_numbers)
# sprintf("there are %d spaces", counter_space)
# sprintf("there are %d other characters", counter_other)

out_list <- list("labels" = c("alphabetical", "numerical", "spaces", "other"), 
                 "output" = c(counter_letters, counter_numbers, counter_space, counter_other))
return(out_list)

}
