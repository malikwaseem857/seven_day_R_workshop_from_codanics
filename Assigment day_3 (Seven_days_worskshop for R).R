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
