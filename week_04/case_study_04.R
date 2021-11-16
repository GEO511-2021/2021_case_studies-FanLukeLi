library(tidyverse)
library(nycflights13)

View(flights)
View(airports)

################################################################################ 
Joined_flights_origin <- flights %>% 
  filter(origin == "JFK" | origin == "LGA" | origin == "EWR") %>% 
  arrange(desc(distance)) %>% 
  left_join(airports, by = c("dest" = "faa"))

Joined_flights_dest <- flights %>% 
  filter(dest == "JFK" | dest == "LGA" | dest == "EWR") %>% 
  arrange(desc(distance)) %>% 
  left_join(airports, by = c("origin" = "faa"))

# joined_flights <- flights %>%
#   filter(origin == "JFK" | origin == "LGA" | origin == "EWR" | dest == "JFK" | dest == "LGA" | dest == "EWR") %>%
#   right_join(airports, by = c("origin" = "faa", "dest" = "faa")) %>%
#   arrange(desc(distance))
# This doesn't work, for: 
# Error Join columns must be unique

farthest_airport_origin <- Joined_flights_origin$name[1]
distance_1 <- Joined_flights_origin$distance[1]

farthest_airport_dest <- Joined_flights_dest$name[1]
distance_2 <- Joined_flights_dest$distance[1]

if (distance_1 < distance_2){
  farthest_airport <- farthest_airport_dest
} else if (distance_1 > distance_2) {
  farthest_airport <- farthest_airport_origin
} else {
  farthest_airport <- farthest_airport_dest
}

farthest_airport

################################################################################