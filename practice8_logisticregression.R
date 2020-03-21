# A researcher is interested in how variables, such as GRE
#(Graduate Record Exam scores), GPA (grade point average) and
#prestige of the undergraduate institution, effect admission into
#graduate school. The response variable, admit/don’t admit, is a binary variable.

#library(fastDummies)

collegedf <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

# prestige/rank is categoricals - create dummy vars
#collegedf2 <- dummy_cols(collegedf, select_columns = "rank", remove_first_dummy = TRUE)

# logistic regression - outcome is binary

# model 1 - only gre + gpa as predictor
mod_lm1 <- glm(admit ~ gre + gpa, family = binomial, data = collegedf)
summary(mod_lm1)
exp(coef(mod_lm1))

# model 2 - full set of predictors
mod_lm2 <- glm(admit ~ gre  + gpa + factor(rank), family = binomial, data = collegedf)
summary(mod_lm2)
exp(coef(mod_lm2))

# compare models
y <- anova(mod_lm1, mod_lm2) # residual deviance statistic to compare the 2 models
# 20.902, df = 3 (number of dummy variables)
1-pchisq(20.902, 3) # p value
# the prestige of a student's undergraduate institution significantly explains
# probability of graduate school admission, after controlling for 
# GRE and GPA

# interpreting individual coefficients of full model
exp(coef(mod_lm2))
# holding GPA and GRE constant, the odds of admission from any institution
# with prestige = 2 is about half of the odds of admission 

# a one-point GRE difference multiplies the odds of admission by 1.002, holding GPA & prrestige constant
# a one-point GPA difference multiplies odds of admission by 2.17, holding GRE and prestige constant
# a one-point rank difference (prestige =2) multiplies odds of admission by 0.509 compared w/ prestige =1 