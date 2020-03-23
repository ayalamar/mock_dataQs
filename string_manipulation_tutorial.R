library(stringr)
# https://www.hackerearth.com/practice/machine-learning/advanced-techniques/regular-expressions-string-manipulation-r/tutorial/

# add a constant string to a set of strings
paste(1:5,c("?","!"),sep = "-") # if # of substitutions don't match the original #
# of strings, it will recycle 

# concatenate strings
text = "San Francisco"
cat(text,"USA",sep = "-")
toString(cat(month.name[1:5],sep = " ")) # toString converts any non-character

# check if strings are equal
setequal(c("monday","tuesday","thursday"), c("monday","tuesday","wednesday"))

# or different
setdiff(c("monday","tuesday","wednesday"), c("monday","thursday","friday"))

string <- "Los Angeles, officially the City of Los Angeles and often known by its initials L.A., is the second-most populous city in the United States (after New York City), the most populous city in California and the county seat of Los Angeles County. Situated in Southern California, Los Angeles is known for its Mediterranean climate, ethnic diversity, sprawling metropolis, and as a major center of the American entertainment industry."
strwrap(string)
#replace strings
chartr("and","for",x = string) #letters a,n,d get replaced by f,o,r
# replace "city" with "state"
str_replace_all(string = string, pattern = c("City"), replacement = "state") #this is case sentitive

string <- c("I sleep 16 hours\n, a day","I sleep 8 hours\n a day.","You sleep how many\t hours ?")
# get the numbers only
unlist(regmatches(string,gregexpr("[[:digit:]]+",text = string)))
#remove punctuations
gsub(pattern = "[[:punct:]]+",replacement = "",x = string)

