# A given car has a number of miles it can run before its battery is depleted,
#where the number of miles are exponentially distributed with an average of
#10,000 miles to depletion.
# If a given individual needs to make a trip that's 3,000 miles,
#what is the probability that she/he will be able to complete the trip without
#having to replace the battery? You can assume the car battery is new for this
#problem.

m = 10000
x = 3000
lambda = 1/m # the rate parameter is the inverse of the expected durations

P_x = 1 - (exp(-x * lambda))
sprintf("There is a %f probability they will be able to complete the trip
        without having to replace the battery", 1-P_x)
