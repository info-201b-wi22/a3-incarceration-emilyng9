library(tidyr)
library(ggplot2)
library(dplyr)
library(plotly)

incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")


genders_juvenile_jail <- incarceration_trends %>% 
  select(year, male_juvenile_jail_pop, female_juvenile_jail_pop) %>%
  pivot_longer(!year, names_to = "Gender", values_to = "Population")

genders_juveniles_pris_pop <- incarceration_trends %>% 
  group_by(year) %>% 
  select(year, female_juvenile_jail_pop, male_juvenile_jail_pop)

genders_juvenile_overtime <- ggplot(genders_juveniles_pris_pop) +
  geom_col(mapping = aes(x = year, y = population, fill = gender)) +
  labs(title = "Male and Female Juveniles Population Overtime", x = "Year", y = "Population", color = "population of different genders") +
  theme(legend.position = "right")
ggplotly(genders_juvenile_overtime)
  
