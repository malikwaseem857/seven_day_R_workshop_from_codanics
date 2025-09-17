## Assignment 2 of day_3 of seven_days_workshop
# Find the number of rows of first 6 months.
df <- nycflights13::flights
library("nycflights13")
library(dplyr)
filter(df, month==1, day==1)
january <- filter(df, month==1)
feburary <- filter(df, month==2)
March <- filter(df, month==3)
April <- filter(df, month==4)
May <- filter(df, month==5)
June <- filter(df, month==6)



# I apologize i tried to save it my excel files but failed many times but i hope i will fix it in future