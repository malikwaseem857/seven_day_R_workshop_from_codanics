# how to save data frames in excel----
install.packages("writexl", dependencies = TRUE)
install.packages("tidyverse")
library(writexl)
library(tidyverse)
# dataframe


data(mpg)

df <- mpg
write_xlsx(df, "mpg.xlsx")



# import  excel file----
# 2 ways
install.packages("readxl", dependencies = TRUE)
library(readxl)

mpg <- read_excel("mpg.xlsx")
View(mpg)

df1 <- read_excel("mpg.xlsx")
# if you want to remove df data from global enviromnet
remove(df)


# plotting in ggplot2
library(ggplot2)

ggplot(data = df, mapping =  aes(x =df$cty, y =df$hwy,)) + geom_point()
# lets color = class
ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point()
# color = manufacurer
ggplot(data = df, mapping = aes(x = cty, y = hwy, col =manufacturer)) +
  geom_point()

ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class)

# lets make 2 columns 
ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, ncol = 2)


# lets make 2 rows
ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2)
# explore more on google about facet wrap grid


# lets change the theme blackin_white but prefere choose is classic

ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2) +
  theme_bw()
# lets add the label
ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2) +
  theme_bw()+
  labs(title = "Row_wise Plot")
# lets add the label on x-axis and Y-axis and color
ggplot(data = df, mapping = aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2) +
  theme_bw()+
  labs(title = "Row_wise Plot", 
       xlabs = "city", y = "Height", col = "Legends")






## Assignment change facet name, change grey to red color of facet_columns 
##  remove the grid. 

library(ggplot2)

# Create a lookup for new facet labels
new_labels <- setNames(
  paste0("car_", seq_along(unique(df$class))),
  unique(df$class)
)

ggplot(data = df, aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2, labeller = labeller(class = new_labels)) +
  theme_bw() +
  labs(title = "Row_wise Plot", 
       x = "City", y = "Height", col = "Legends")

# change grey to red color 

ggplot(data = df, aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2, labeller = labeller(class = new_labels)) +
  theme_bw() +
  theme(
    strip.background = element_rect(fill = "red", color = "black"), # background red
    strip.text = element_text(color = "white", face = "bold")       # text white & bold
  ) +
  labs(title = "Row_wise Plot", 
       x = "City", y = "Height", col = "Legends")

##  remove the grid. 

ggplot(data = df, aes(x = cty, y = hwy, col = class)) +
  geom_point() + 
  facet_wrap(~class, nrow = 2, labeller = labeller(class = new_labels)) +
  theme_bw() +
  theme(
    strip.background = element_rect(fill = "red", color = "black"), # facet background red
    strip.text = element_text(color = "white", face = "bold"),      # facet text white
    panel.grid = element_blank()                                    # removes all grid lines
  ) +
  labs(title = "Row_wise Plot", 
       x = "City", y = "Height", col = "Legends")

# data Transformation 
install.packages("nycflights13", dependencies = TRUE)
library(nycflights13)
library(tidyverse)

df <- nycflights13::flights

# let see the summary of it
summary(df)


# flitering of data

filter(df, month==1, day==1)
january <- filter(df, month==1, day==1)

nrow(january)

january <- filter(df, month==1, day==1, carrier=="UA")
# let  find the jan and feb rows 
jan_feb <- filter(df, month %in% c(1,2))
jan_mar <- filter(df, month %in% c(1,2,3))

# & used for to fulfill both side condition
jan_feb <- filter(df, month==1& month==2)
# | is called Or one side must be fulfilled
jan_feb <- filter(df, month==1 | month==2)



filter(df, arr_delay > 120)
filter(df, arr_delay > 180)
# lets select the range and means in between these 2 values

filter(df, arr_delay > 120 & arr_delay <300)
# lets use or operator
filter(df, arr_delay > 120 | arr_delay <300)



## day_3 finished
