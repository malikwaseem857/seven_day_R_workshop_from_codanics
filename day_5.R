df <- nycflights13::flights

# Plotting

library(ggplot2)


colnames(df)

# if we draw a plot what should you write first
# we want a point plot of distance vs arrival_delay
ggplot(data = df, mapping = aes(df$x=distance, df$y=arr_delay))+geom_point()
# lets we do carrier as color
ggplot(data = df, aes(x = distance, y = arr_delay, color = carrier)) +
  geom_point()

# dypler function is used to extract some data from big data


# data Visualization----
# statistics is the base of data understanding
# Andrew abela guide for data understanding
# 1. distribution 2. relationship, 3.comparison ,4. composition


# 1. distribution


# comparison, relationship and composition depend upon distribution
# bell-curved data is normal data, normally distribution or Gaussian distribution
# To check data distribution
# 1. Data Visualization by histogram 
# 2. Statistical Method: Shapiro_wilk test to check the data is normal or not


# 2. relationship 
# positive correlation when one increase other also increase
# negative correlation when one increase other decrease

# Pearson R - for normal data distribution
# spearmann R - for non-normal distribution
# R values range form -1 to 1.
# if R2 value is 80-100% highly  positive correlated
# if R2 values is -80% highly negative
# if R2 is -50, or 50% it will negative or positive

# PCA plot is used for multivariate variables analysis
# to draw multi_dimensional data 
# maximum 5 variable draw in r or coding
# in PCA we can draw 19 variables in the form of vector of this df data
# A vector has magnitude and direction both but scalar has just magnitude



# normal distribution is checked of a variable not whole data and it must be numeric
# we cannot check of categorical variable

# normal distribution
# histogram
hist(df$distance)
# qqnorm 
qqnorm(df$distance)

shapiro.test(df$distance)

# lets generate data
normal_data <- rnorm(200)

hist(normal_data)
hist(normal_data, col= "blue")

qqnorm(normal_data)

shapiro.test(normal_data)
# if p-value is above 0.05 data is normal
# if data is non-normal do 1. log transformation , 2. square mean, 3. Min-Max scaling, 4. standardization



## 3. comparison



# corrplot
install.packages("corrplot", dependencies = TRUE)
library(corrplot)
df <- mtcars
# to check the correlation
m <- cor(df)
# correlation of m data
corrplot(m)
# add number
corrplot(m, method = "number")
# add order
corrplot(m, method = "number", order = "alphabet")

# take upper values
corrplot(m, method = "number", order = "alphabet", type = "upper")
#take lower values
corrplot(m, method = "number", order = "alphabet", type = "lower")


corrplot.mixed(m, lower= "number", upper = "pie")

# clustering ( blue= +ve correlated, red = _ve correlated)

corrplot(m, order = 'hclust')
#add addrect
corrplot(m, order = 'hclust', addrect = 2)


m <- cor(df, method = "pearson")

## book for this plot
# read the library of each package
