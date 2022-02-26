library(mapproj)
library(dplyr)
library(maps)
library(tidyverse)
library(ggplot2)
library(plotly)
library(urbnmapr)
  
incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

state_shape <- map_data('state')

state_abbrevs <- data.frame(state.abb, state.name) %>%
  add_row(state.abb = "DC", state.name = "District of Columbia")

state_shape <- map_data('state')
  
female_juveniles_pris_pop <- incarceration_trends %>% 
  group_by(state) %>%
  filter(year == "2018") %>%
  summarize(total_female_juveniles = sum(female_juvenile_jail_pop, na.rm = T))

female_juveniles_pris_pop <- left_join(female_juveniles_pris_pop, state_abbrevs, by = c('state' = 'state.abb'))

female_juveniles_pris_pop <- female_juveniles_pris_pop %>%
  mutate(region = tolower(state.name))

state_shape <- left_join(state_shape, female_juveniles_pris_pop, by = 'region')

female_juveniles_pop_2018 <- ggplot(data = state_shape) +
geom_polygon(mapping = aes(x = long, y = lat, fill = total_female_juveniles, group = group), color = "white") +
labs(title = "Female Juveniles Population in 2018", fill = 'Female') +
  scale_fill_continuous(low = 'pink', high = 'purple', labels = scales::label_number_si()) +
coord_map() 

ggplotly(female_juveniles_pop_2018)


  
  
  