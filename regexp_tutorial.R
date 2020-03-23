# https://rstudio-pubs-static.s3.amazonaws.com/74603_76cd14d5983f47408fdf0b323550b846.html

gdf <- read.delim("data/gapminder.txt", header = TRUE)

# some hypothetical filenames
files <- c("block0_dplyr-fake.rmd", "block000_dplyr-fake.rmd.txt", "gapminderDataFiveYear.txt", 
           "regex.html", "regex.md", "regex.R", "regex.Rmd", "regex.Rpres", 
           "xblock000_dplyr-fake.rmd")

# what countries have an apostrophe in its name?
grep('\'', levels(gdf$country), value = TRUE)

#######################
#######################
# using quantifiers to specify how repetitions of pattern
strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")

grep("ac*b", strings, value = TRUE) # *: matches at least 0 times
grep("ac+b", strings, value = TRUE) # +: matches at least once
grep("ac?b", strings, value = TRUE) # ?: matches at most once
grep("ac{2}b", strings, value = TRUE) # {n}: matches exactly n times
grep("ac{2,}b", strings, value = TRUE) # {n,}: matches at least n times
grep("ac{2,3}b", strings, value = TRUE) # {n,m}: matches between n:m times

# Using quantifiers find all countries with ee, but not eee, in its name
grep("e{2}", levels(gdf$country), value = TRUE)

#######################
#######################
# find positions within strings
strings <- c("abcd", "cdab", "cabd", "c abd")

grep("ab", strings, value = TRUE) # return all matches
grep("^ab", strings, value = TRUE) # return all matches starting with "ab"
grep("ab$", strings, value = TRUE) # return all matches ending with "ab"
grep("\\bab", strings, value = TRUE) # matches empty string at edge of word

# Find the string of country names that Start with “South”
grep("^South", levels(gdf$country), value = TRUE)
# Find the string of country names that End in “land”
grep("land$", levels(gdf$country), value = TRUE)
# Find the string of country names that Have a word in its name that starts with “Ga”
grep("\\bGa", levels(gdf$country), value = TRUE)

#######################
#######################
# character classes
string <- c("AAAAA", "AAAa", "bb", "40dJ", "99", " ", "#")

grep("[[:upper:]]", string, value = TRUE) # uppercase values
grep("[[:alnum:]]", string, value = TRUE) # alphanumeric values
grep("[[:digit:]]", string, value = TRUE) # digits
grep("[[:alnum:]_]", string, value = TRUE) # word characters

#Find all countries that use punctuation in its name 
grep("[[:punct:]]", levels(gdf$country), value = TRUE)

#Write a function that keeps only alnum chars, 
#remove all spaces,
#converts to lower case,
#and returns it the newly formatted string
clean.text <- function(string){
  string <- gsub("[^[:alnum:]]", "", string)
  string <- gsub(" ", "", string)
  string <- tolower(string)
    return(string)
}

#######################
#######################
# advance opertators

strings <- c("^ab", "ab", "abc", "abd", "abe", "ab 12")

grep("ab.", strings, value = TRUE) # return anything starting with ab
grep("ab[c-e]", strings, value = TRUE) # return start w/ ab, end between c:e
grep("ab[^c]", strings, value = TRUE) # return matches except those in []
grep("^ab", strings, value = TRUE) # return start w/ ab
grep("\\^ab", strings, value = TRUE) # return start with ^ (metacharacter)
grep("abc|abd", strings, value = TRUE) # | means or
gsub("(ab) 12", "\\1 34", strings) # "backreference" (ab)

#Find countries in Gapminder with letter i or t, and ends with land, and
#replace land with LAND using backreference.

replaceland <- gsub("(.*[it].*)land$", "\\1LAND", levels(gdf$country), ignore.case = TRUE)
grep("LAND", replaceland, value = TRUE)
