# Suppose you're analyzing a population of 100,000 people, 
#and you're trying to understand life expectancy. 
#Within this population of 100,000 people, 65% can expect to 
#live to the age of 70, while 25% can expect to live to age 80.

#Given that a person is already 70, what is the probability 
#that they live to the age 80?

p70 = 0.65
p80 = 0.25

p80givenp70 = p70*p80
sprintf("the probability of a 70 year old living to 80 is %f", p80givenp70)
