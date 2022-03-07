library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)

incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

male_juveniles_WY <- incarceration_trends %>%
  group_by(state) %>%
  filter(state == "WY") %>%
  summarize(male_juvenile = sum(male_juvenile_jail_pop, na.rm = T))

female_juveniles_WY <- incarceration_trends %>%
  group_by(state) %>%
  filter(state == "WY") %>%
  summarize(female_juvenile = sum(female_juvenile_jail_pop, na.rm = T))

female_male_juveniles_WY <- left_join(male_juveniles_WY, female_juveniles_WY, by = "state") %>%
  pivot_longer(col= c("male_juvenile", "female_juvenile"),
               names_to = "genders") 

ggplot(female_male_juveniles_WY) +
  geom_col(aes(x = genders, y = value, group = genders, color = genders)) +
ylab("Population") +
  scale_fill_brewer(palette = "Pastel1") +
  xlab("Female and Male Juveniles") +
  labs(title = "The Juveniles Population for Male and Female in Wyoming")


  
  

  
  
  

  
  


