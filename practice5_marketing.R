# Suppose you’re working at a company similar to Airbnb, 
# and the marketing team has come to you to help them figure out
# which channels (excluding direct) are best for them to focus on.

bnb <- read.csv("data/airbnb_test_data.csv", header=TRUE)

library(dplyr)

bnb.summary <- bnb %>%
  filter(affiliate_channel != "direct") %>%
  group_by(affiliate_channel) %>%
  summarise(num_customers = n()) %>%
  arrange(desc(num_customers))

sprintf("Excluding direct channels, it is recommended they focus on %s", bnb.summary[[1,1]])
