# find the top state for births
library(dplyr)
yg <- read.csv("https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/06_Stats/US_Baby_Names/US_Baby_Names_right.csv",
               header=TRUE)
head(yg)

yg.summary <- yg %>%
  group_by(State) %>%
  summarise(total_births = sum(Count)) %>%
  arrange(desc(total_births))

print(yg.summary[1,])
