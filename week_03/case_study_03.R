library(ggplot2)
library(gapminder)
library(dplyr)

plot <- gapminder %>% 
  filter(country != "Kuwait") %>% 
  ggplot(aes(x = lifeExp, y = gdpPercap)) + 
  geom_point(aes(color = continent, size = pop / 100000)) + 
  facet_wrap(~year, nrow = 1) + 
  scale_y_continuous(trans = "sqrt") + 
  theme_bw() +
  labs(x = "Life Expectancy", 
       y = "GDP per capita", 
       color = "Continent", 
       size = "Population(100k)") + 
  theme(axis.title.x = element_text(size = 16), 
        axis.title.y = element_text(size = 14))
plot

ggsave("case_study_03_plt01.png", 
       plot = plot, 
       width = 20, 
       height = 5)

gapminder_continent <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), 
            pop = sum(as.numeric(pop)))

plot2 <- ggplot(data = gapminder) + 
  facet_wrap(~continent, nrow = 1) + 
  geom_line(data = gapminder, 
            aes(x = year, 
                y = gdpPercap, 
                group = country, 
                color = continent)) + 
  geom_point(data = gapminder, 
             aes(x = year, 
                 y = gdpPercap, 
                 color = continent)) + 
  # scale_color_discrete(name = "Continent") + 
  theme_bw() + 
  geom_line(data = gapminder_continent,
            aes(x = year,
                y = gdpPercapweighted)) +
  geom_point(data = gapminder_continent,
             aes(x = year,
                 y = gdpPercapweighted, 
                 size = pop / 100000)) + 
  labs(x = "Year", 
       y = "GDP Per capita", 
       color = "Continent", 
       size = "Population(100k)") + 
  theme(axis.title.x = element_text(size = 16), 
        axis.title.y = element_text(size = 14))
plot2

ggsave("case_study_03_plt02.png", 
       plot = plot2, 
       width = 20, 
       height = 5)
