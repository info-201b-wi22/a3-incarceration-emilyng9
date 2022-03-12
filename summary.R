library(dplyr)

incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

#In what year did the U.S have the highest male Juvenile population?
summary_source <- list()

summary_source$highest_male_juvenile_population <- incarceration_trends %>% 
    filter(male_juvenile_jail_pop == max(male_juvenile_jail_pop, na.rm = T)) %>%
    pull(year) 

#What is the total female Juvenile population in the U.S by the recent date?
summary_source$recent_female_juvenile_pop <- incarceration_trends %>%
    filter(year == max(year)) %>%
    summarize(total_female_juveniles = sum(female_juvenile_jail_pop, na.rm = T)) %>% 
  pull(total_female_juveniles)


  
#Which state has the lowest juvenile population for males?
summary_source$state_lowest_juvenile_male_pop <- incarceration_trends %>%
  filter(male_juvenile_jail_pop == min(male_juvenile_jail_pop, na.rm = T)) %>% 
  pull(state)


  
#What is the total male Juvenile population in the U.S by the recent date?
summary_source$recent_male_juvenile_pop <- incarceration_trends %>%
    filter(year == max(year)) %>%
    summarize(total_male_juveniles = sum(male_juvenile_jail_pop, na.rm = T)) %>%
    pull(total_male_juveniles)

  
#In what year did the U.S have the highest female Juvenile population?
summary_source$highest_female_juvenile_population <- incarceration_trends %>% 
  filter(female_juvenile_jail_pop == max(female_juvenile_jail_pop, na.rm = T)) %>%   
  pull(year)

  
