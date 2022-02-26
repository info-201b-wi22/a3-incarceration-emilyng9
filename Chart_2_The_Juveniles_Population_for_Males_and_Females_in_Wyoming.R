library(ggplot2)
library(plotly)
library(dplyr)
library(tidyverse)
RColorBrewer::display.brewer.all()


#The juveniles population for both males and females in WY?

WY_juvenile_pop <- incarceration_trends %>% 
filter(state == "WY") %>% 
select(year, male_juvenile_jail_pop, female_juvenile_jail_pop) %>% 
  pivot_longer(!year, names_to = "Gender", values_to = "Population") 


Juveniles_in_WY <- ggplot(WY_juvenile_pop) +
geom_col(mapping = aes(x = Population, y = Gender, fill = Gender)) +

scale_fill_brewer(palette = "Pastel2") +
labs(x = "Population", y = "Gender", title = "The juveniles population for both males and females in WY", fill = "Gender") 

ggplotly(Juveniles_in_WY)  
