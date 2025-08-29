# how to write a code----
x <- 8
y <- 9
x+y
# same object will repeated if insert again

z <- x+y

z
# conditional operators
x > y

# how to activates repositories----
setRepositories() # set 1-7 repositories

# how to install packages----
install.packages("readxl")
install.packages("tidyverse", dependencies = TRUE)
library(readxl)
library(tidyverse)
data()

data(iris)
ggplot(iris, aes(Species, Sepal.Width)) + geom_point()
