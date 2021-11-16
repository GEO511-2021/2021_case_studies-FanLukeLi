library(tidyverse)
library(reprex)
library(sf)

library(spData)
data(world)

ggplot(world,aes(x=gdpPercap, color=continent, fill = continent))+
  geom_density(alpha=0.5,color=F) + 
  labs(x = "GDP Per Capita", 
      y = "Density") + 
  theme(legend.position = "bottom")

reprex(venue = "gh")


# Copy line 1 through 9 and run line 11, after running, the example is already in clipboard, then paste it onto github comment