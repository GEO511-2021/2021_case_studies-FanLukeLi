library(spData)
library(sf)
library(tidyverse)
library(units)

data(world)
data(us_states)

albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
canada <- world %>% 
  st_transform(albers) %>% 
  filter(name_long == "Canada")

canada_buffer <- st_buffer(canada[7], 10000)

new_york <- us_states %>%
  st_transform(albers) %>%
  filter(NAME == "New York")

new_york_area <- new_york[4]

border <-
  st_intersection(canada_buffer, new_york_area)

plot_new_york_buffer <- ggplot() + 
  geom_sf(data = new_york[1]) + 
  geom_sf(data = border, fill = "red") + 
  labs(title = "New York Land within 10km") + 
  theme(title = element_text(size = 16))
  


st_area(border) %>% 
  set_units(km^2)
