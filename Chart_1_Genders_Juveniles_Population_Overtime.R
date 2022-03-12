library(tidyr)
library(ggplot2)
library(dplyr)
library(plotly)

incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

total_male_juvenile <- incarceration_trends %>% 
  group_by(year) %>% 
  summarize(male_juvenile = sum(male_juvenile_jail_pop, na.rm = T))

total_female_juvenile <- incarceration_trends %>% 
  group_by(year) %>% 
  summarize(female_juvenile = sum(female_juvenile_jail_pop, na.rm = T))

sum_female_male_juvenile <- left_join(total_male_juvenile, total_female_juvenile, by = "year") %>%
  pivot_longer(col= c("male_juvenile", "female_juvenile"),
               names_to = "Genders")

ggplot(sum_female_male_juvenile) +
  geom_line(aes(x = year, y = value, group = Genders, color = Genders)) +
  ylab("Number of Female and Male Juveniles") +
  xlab("Year") +
  labs(title = "Female and Male Juveniles Population Overtime") +
  scale_color_hue(labels = c("Female Juvenile", "Male Juvenile"))
  
  
  
  