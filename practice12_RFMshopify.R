#On a scale of 1-3, with 1 being least valuable and 3 being most valuable,
#can you classify customers based on recency of last purchase? For example,
#a purchase made 1 month ago is more valuable than one made 5 months ago,
#so the former customer would have a higher recency score than the latter.
library(lubridate)
library(dplyr)

odf <- read.csv("data/Online_Retail.csv", header = TRUE)

odf$InvoiceDate <- as.Date(odf$InvoiceDate, "%m/%d/%y") # convert date data to calculable format

odf <- odf %>%
  group_by(CustomerID) %>%
  mutate(last_purchase_date = max(InvoiceDate),
         days_since_LP = Sys.Date() - last_purchase_date) 

# hist(as.numeric(odf$days_since_LP)) 
quantile_splits <- quantile(as.numeric(odf$days_since_LP)) # calculate recency score based on quartiles

odf <- odf %>%
  mutate(recency_score = ifelse(days_since_LP %in% quantile_splits[[4]]:quantile_splits[[5]], "4",
                                ifelse(days_since_LP %in% quantile_splits[[3]]:quantile_splits[[4]], "3",
                                       ifelse(days_since_LP %in% quantile_splits[[2]]:quantile_splits[[3]], "2",
                                              ifelse(days_since_LP %in% quantile_splits[[1]]:quantile_splits[[2]], "1")))))



