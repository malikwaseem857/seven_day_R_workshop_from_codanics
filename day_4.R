install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
df <- nycflights13::flights


summary(df)
glimpse(df)

# iris example
data(iris)
# group_by gives us individually means
#  group_by function  divides into categorical variables
iris %>%
  group_by(Species) %>%
  summarize(avg = mean(iris$Sepal.Width) ) %>%
  arrange(avg)

# summary gives us overall means 
summary(iris)
average(iris)
install.packages("dplyr")   # only once
library(dplyr)              # every new session

# remember don't use $ sign in piping function
# original data
df %>%
group_by(df$carrier) %>%
  summarize(avg = mean(hour)) %>%
  arrange(avg)
# to calculate the sum 
df %>%
  group_by(df$carrier) %>%
  summarize(add = sum(hour)) %>%
  arrange(add)


# let do the select function
# to specify one object we use this function
df1 <- df %>% select(year, month, day)
df2 <- df %>% select(year, month, day) %>% filter(month ==1)
df3 <- df %>% select(year,day, month)


# use pipe operator in df function
# arry_time in particular year

df %>% select(year:arr_time)
# use rename function

df <- rename(df, dep_time= departure_time)

# lets arrange ascending order df  arrival time

arr_time <- df %>% arrange(arr_time)
arr_time <- df %>% arrange(desc(arr_time))


df %>% distinct(df$arr_time)
df %>% distinct(flight)
