# There are only two airports in "airports" in New York city, 
# they are West 30th St. Heliport(JRA) and John F Kennedy Intl(JFK). 
# In "flights", no flights with JRA as origin or destination can be found and
# there are no flights with JFK as destination. 

# That is why the final solution to this problem is to 
# filter flights with JFK as origin and arrange the data by distance
# in descendant order, then left join airports by destination code to
# lead to the final dataset. Finally, just return the name of the first
# row of the final dataset, which would be name of the farthest airport
# of any airports in NYC
# Four steps taken. 

library(tidyverse)
library(nycflights13)

flights_JFK_origin <- flights %>% 
  filter(origin == "JFK") %>% 
  arrange(desc(distance))

# flights_JFK_dest <- flights %>% 
#   filter(dest == "JFK") %>% 
#   arrange(desc(distance))

# flights_JRA <- flights %>% 
#   filter(origin =="JRA" | dest == "JRA") %>% 
#   arrange(desc(distance))

View(flights_JFK)
# View(flights_JRA)

joined_flights_jfk_origin <- flights_JFK_origin %>% 
  left_join(airports, by = c("dest" = "faa"))

# joined_flights_jfk_dest <- flights_JFK_dest %>% 
#   left_join(airports, by = c("dest" = "faa"))

joined_flights_jfk_origin

# joined_flights_jfk_dest

joined_flights_jfk_origin$name[1]

################################################################################ 
# All OF THE ABOVE LEADS TO: 
Joined_flights_jfk_origin <- flights %>% 
  filter(origin == "JFK") %>% 
  arrange(desc(distance)) %>% 
  left_join(airports, by = c("dest" = "faa"))

Joined_flights_jfk_origin$name[1]

################################################################################