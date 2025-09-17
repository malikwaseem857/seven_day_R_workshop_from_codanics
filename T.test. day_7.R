# data Import
df <- iris

# one sample t.test
# mu is hypothetical mean
t.test(df$Sepal.Length, mu = 6.5)
# two sample t.test
# independent t_test/ unpaired

t.test(df$Sepal.Length, df$Petal.Length)

# here assumption are not met
t.test(df$Sepal.Length, df$Petal.Length, paried = TRUE)

t.test(df$Sepal.Length, df$Petal.Length, paried = FALSE)

# paired t.test 
pre_treatment <- c(rnorm(2000, mean = 150, sd = 10))
post_treatment <- c(rnorm(2000, mean = 144, sd = 9))
# now perform t test
t.test(pre_treatment, post_treatment, paired = TRUE)

library(tidyverse)

library(dplyr)

df <- iris %>%
  filter(Species %in% c("setosa", "versicolor")) %>%
  droplevels()   # removes unused levels

# Now run t-test
t.test(Petal.Width ~ Species, data = df)


                                   
                                   
                                   
                                   
                                   
                                   
                                   