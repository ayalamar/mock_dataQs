
library(dplyr)
yg <- read.csv("https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/06_Stats/US_Baby_Names/US_Baby_Names_right.csv",
               header=TRUE)
head(yg)

# find the top state for births
yg.summary <- yg %>%
  group_by(State) %>%
  summarise(total_births = sum(Count)) %>%
  arrange(desc(total_births))

print(yg.summary[1,])

# determine what the top boy and girl names were in 2009
yg.2009 <- yg %>%
  filter(Year == 2009) %>%
  group_by(Gender) %>%
  top_n(1)