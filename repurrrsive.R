library(tidyverse)
library(repurrrsive)

# how many colors are in each wes anderson movie palette?
wesanderson %>%
  map_int(length)

# which characters are included in game of thrones dataset?
got_chars %>%
  map_chr(~ .x$name)

# which game of thrones characters are alive? 
# return results as a tibble
got_chars %>%
  set_names(map_chr(got_chars, "name"))  %>%
  map_chr(~ .x$alive) %>%
  enframe() # from tibble package

# write a model that predicts lifeexp by year for each country in gapminder data
# note gap_simple from repurrrsive is same as gapminder from gapminder dataset
gap_simple %>%
  group_by(country) %>%
  nest() %>%
  mutate(fit = map(data, ~ lm(lifeExp ~ year, data = .x)))