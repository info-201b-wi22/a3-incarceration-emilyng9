incarceration_trends <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

#In what year did the U.S have the highest male Juvenile population?
highest_male_juvenile_population <- incarceration_trends %>% 
    filter(male_juvenile_jail_pop == max(male_juvenile_jail_pop, na.rm = T)) %>% 
    pull(year)
highest_male_juvenile_population
  
#What is the total female Juvenile population in the U.S by the recent date?
recent_female_juvenile_pop <- incarceration_trends %>%
    filter(year == max(year, na.rm = T)) %>%
    summarize(total_female_juveniles = sum(female_juvenile_jail_pop, na.rm = T))
  pull(recent_female_juvenile_pop)
recent_female_juvenile_pop

  
#Which state has the lowest juvenile population for males?
state_lowest_juvenile_male_pop <- incarceration_trends %>%
  filter(male_juvenile_jail_pop == min(male_juvenile_jail_pop, na.rm = T)) %>% pull(state)
state_lowest_juvenile_male_pop

  
#What is the total male Juvenile population in the U.S by the recent date?
recent_male_juvenile_pop <- incarceration_trends %>%
    filter(year == max(year, na.rm = T)) %>%
    summarize(total_male_juveniles = sum(male_juvenile_jail_pop, na.rm = T))
    pull(recent_male_juvenile_pop)
recent_male_juvenile_pop

  
#In what year did the U.S have the highest female Juvenile population?
highest_female_juvenile_population <- incarceration_trends %>% 
  filter(female_juvenile_jail_pop == max(female_juvenile_jail_pop, na.rm = T)) %>% 
  pull(year)
highest_female_juvenile_population
  
