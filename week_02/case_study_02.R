library(tidyverse)

temp = read.csv("station.csv", na = "999.90")

temp

temp$mean_summer_temp <- (temp$JUN + temp$JUL + temp$AUG) / 3

temp$mean_summer_temp

temp %>% 
  # ggplot(aes(x = YEAR, y = mean_summer_temp)) + 
  ggplot(aes(x = YEAR, y = J.J.A)) + 
  geom_line(color = "green") + 
  geom_smooth(method = "loess", color = "blue") + 
  labs(x = "Years 1883 ~ 2021", 
       y = "Mean summer temperature (C)", 
       title = "Mean Summer Temperatures in Buffalo, NY",
       subtitle = "Summer includes June, July and August \n Data from the Global Historical Climate Network \n Blue line is a LOESS smooth"
  ) + 
  theme(plot.title = element_text(size = 25, hjust = 0.5), 
        plot.subtitle = element_text(size = 20, hjust = 0.5), 
        axis.title.x = element_text(size = 14), 
        axis.title.y = element_text(size = 14))

ggsave("geo511_case_study_week2_summer_temp_year_Fan_Li.png", 
       width = 8, 
       height = 4)

png(filename = "test.png", width = 800, height = 400, units = "px", pointsize = 12, 
    bg = "white", res = NA, family = "", restoreConsole = TRUE, 
    type = c("windows", "cario"), antialias, 
    symbolfamily = "default")
