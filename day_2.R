install.packages("ggplot2", dependencies = TRUE)
library(ggplot2)

# import dataset

data(iris)
View(iris)


# scatter plot
activate packages
library(ggplot2)

ggplot(data = iris, mapping = aes(x= iris$Sepal.Length, y=iris$Sepal.Width))+
  geom_point()

ggplot(data = iris, mapping = aes(x= Sepal.Length, y= Sepal.Width))+
  geom_point()
# colour should be in categorical variables bases
# adding color
ggplot(data = iris, mapping = aes(x= Sepal.Length, y= Sepal.Width,
                                  col = Species))+ geom_point()
# changes based on sizes # this doesn't make sense or good
ggplot(data = iris, mapping = aes(x= Sepal.Length, y= Sepal.Width,
                                  size = Species))+ geom_point()
# changes based on shapes
ggplot(data = iris, mapping = aes(x= Sepal.Length, y= Sepal.Width,
                                  shape = Species))+ geom_point()
# changes based on color
ggplot(data = iris, mapping = aes(x= Sepal.Length, y= Sepal.Width,
                                  color = Species))+ geom_point(size= 2)
# changes based on shapes and color
ggplot(data = iris, mapping = aes(x= Sepal.Length,
                                  y= Sepal.Width,
                                  shape = Species, color = Species))+ geom_point()



# plot on mpg
data(mpg)
ggplot(data = mpg, mapping = aes(x= cty, y = hwy)) + geom_point()
# lets add color
ggplot(data = mpg, mapping = aes(x= cty, y = hwy, col= manufacturer)) + geom_point()
# how to save the plot by export, 
p1 <- ggplot(data = mpg, mapping = aes(x= cty, y = hwy, col= manufacturer)) + geom_point()
# save 
ggsave("mpg_polt.pdf", plot = p1, width = 5, height = 6, units = "in")
 # remember size depend upon the A4 paper size 9 inches normally
# for png used mpi for it it its range is 150-300 maximum
ggsave("mpg_polt.png", plot = p1, width = 5, height = 6, units = "in", dpi = 300)
## Try to use in pdf because it can be editable in furture
# tidyverse
library(tidyverse)
#  %>% is a pipeline filter
iris %>% select(iris$Species=="Se")