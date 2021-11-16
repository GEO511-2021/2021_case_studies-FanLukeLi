library(raster)
library(sp)
library(spData)
library(tidyverse)
library(sf)
library(dplyr)

data(world)
tmax_monthly <- getData(name = "worldclim", var = "tmax", res = 10)

# Step 1: prepare country polygon data
world_prep <- world %>% 
  filter(continent != "Antarctica") %>% 
  as("Spatial")

gain(tmax_monthly) <- 0.1

# Step 2: prepare climate data
tmax_annual <- max(tmax_monthly)

names(tmax_annual) <- "tmax"

# Step 3: calculate maximum temperature observed in each country
temp_max <- raster::extract(tmax_annual, world_prep, fun = max, na.rm = TRUE, small = TRUE, sp = TRUE) %>% 
  st_as_sf()

# Step 4: communicate results
ggplot(temp_max) + 
  geom_sf(aes(fill = tmax)) + 
  scale_fill_viridis_c(name = "Annual\nMaximum\nTemperature (C)") +
  theme(legend.position = 'bottom')

temp_max %>% 
  st_set_geometry(NULL) %>% 
  select(name_long, continent, tmax) %>% 
  group_by(continent) %>% 
  top_n(1) %>% 
  arrange(desc(tmax))
  

