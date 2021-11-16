library(tidyverse)
library(spData)
library(sf)

library(mapview)
library(foreach)
library(doParallel)
registerDoParallel(4)
getDoParWorkers()

library(tidycensus)
census_api_key("4cb74396c72ec3e15b6bc14d9c6ea8ca7ffadba0", overwrite = TRUE, install = TRUE)

racevars <- c(White = "P005003", 
              Black = "P005004", 
              Asian = "P005006", 
              Hispanic = "P004003")

options(tigris_use_cache = TRUE)
erie <- get_decennial(geography = "block", variables = racevars, 
                      state = "NY", county = "Erie County", geometry = TRUE, 
                      summary_var = "P001001", cache_table = T)

erie_crop <- st_crop(erie, xmin = -78.9, xmax = -78.85, ymin = 42.888, ymax = 42.92)

# enlarge this area?

races = unique(erie_crop$variable)

# test 1
foreach(races, i=1:4, .combine = "rbind") %do%
  races[i]

# test 2
foreach(i=1:4, .combine = "rbind") %do%
  races[i]

# test 3
buffalo_dots <- foreach(i=1:4, .combine = "rbind") %do% {
  erie_crop %>% 
    filter(variable == races[i]) %>% 
    st_sample(size = .$value) %>% 
    st_as_sf() %>% 
    mutate(variable = races[i])
}
  
mapview(buffalo_dots, 
        cex = 1, 
        alpha = 0)

