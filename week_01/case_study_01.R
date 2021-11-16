# This is code for week 1 case study of GEO 511 fall 2021

data("iris")
petal_length_mean <- mean(iris$Petal.Length)
petal_length_mean
hist(iris$Petal.Length, 
     main = "Histogram for Petal Length", 
     xlab = "Petal Length", 
     ylab = "Frequency of Petal Length", 
     col = "lightgreen", 
     border = "blue", 
     las = 1, # place ylab horizontally
     breaks = 6,
     # breaks = c(1:7), 
     # ylim = c(0,50), 
     ylim = c(0,1), # for prob = TRUE
     prob = TRUE
)
lines(density(iris$Petal.Length))

library(tidyverse)
library(here)
library(ggplot2)
iris %>% 
  ggplot(aes(x = Petal.Length)) + 
  geom_histogram(breaks = seq(0, 7, by = 1), 
                 col = "blue",
                 fill = "lightyellow",
                 # aes(fill = ..count..), # for scale_fill_gradient
                 alpha = .5, 
                 aes(y = ..density..)) + 
  labs(title = "Histogram for Petal Length", x = "Petal Length", y = "Count") + 
  # xlim(c(0, 7)) + 
  # ylim(c(0, 50)) + 
  # scale_fill_gradient("Count", low = "green", high = "red") + 
  geom_density(col = 2)

