#create a line chart with both the daily and
#7-day moving average for the close price for Apple stock.

library(ggplot2)
library(tidyquant)

adf <- read.csv("data/AAPL.csv", header = TRUE)

adf$Date <- as.Date(adf$Date)

ggplot(adf, aes (x=Date, y=Adj.Close)) +
  geom_line() +
  geom_ma(ma_fun = SMA, n = 7) 

