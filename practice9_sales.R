# Given the following data set, can you plot a chart that shows the percent of revenue
#by marketing source?
#You can assume that purchase_value is revenue in this case, and you'll have to calculate
#the percent of revenue by source prior to plotting.

salesdf <- read.csv("data/sales.csv", header = TRUE)

library(ggplot2)
library(dplyr)

total_revenue = sum(salesdf$purchase_value)

salesdf.summary <- salesdf %>%
  group_by(source) %>%
  summarise(percent_revenue = (sum(purchase_value)/total_revenue)*100)

ggplot(salesdf.summary, aes(x = source, y = percent_revenue)) + 
  geom_col() + 
  ylab("Percent of revenue") +
  xlab("Marketing source")
