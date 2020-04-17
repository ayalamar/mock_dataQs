# TIME SERIES ANALYSIS

data("AirPassengers")
class(AirPassengers)

start(AirPassengers)
end(AirPassengers)

frequency(AirPassengers)
summary(AirPassengers)

boxplot(AirPassengers ~ cycle(AirPassengers))
# which particular month do we see maximum traffic
# can see seasonality

plot(AirPassengers) # can see trend
plot(diff(log(AirPassengers)))

# address a few issues
plot(log(AirPassengers)) # address unequal variances - make variance equal
plot(diff(log(AirPassengers))) # address trend - make time series stationary to do time series modelling

library(tseries)
# AR I MA - auto regressive integration Moving Avg
# p  d  q


acf(diff(log(AirPassengers))) # calculates "q" coefficient for MA
pacf(diff(log(AirPassengers))) # calculates "p" coefficient for AR
plot(diff(log(AirPassengers)))

# fit ARIMA model and predict next 10 years
fit <- arima(log(AirPassengers),
             c(0,1,1),
             seasonal = list(order = (c(0,1,1)),
                             period = 12))
pred <- predict(fit, n.ahead = 10*12)
pred1 <- 2.718^pred$pred # e to the power of

ts.plot(AirPassengers,
        2.718^pred$pred,
        log = "y",
        lty = c(1,3))

# test the model
datawide <- ts(AirPassengers,
               frequency = 12,
               start = c(1949,1),
               end = c(1959,12))
fit <- arima(log(datawide),
             c(0, 1, 1),
             seasonal = list(order = c(0, 1, 1), period = 12))
pred <- predict(fit, n.ahead = 10*12)
pred1 <- 2.718^pred$pred
data1 <- head(pred1,12)

predicted_1960 <- round(data1, digits = 0) #round it
original_1960 <- tail(AirPassengers, 12)

