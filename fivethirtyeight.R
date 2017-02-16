library(fivethirtyeight)
library(tidyverse)
library(ggthemes)

bob_ross %>%
  gather(feature, presence, apple_frame:wood_framed) %>%
  group_by(feature) %>%
  summarise(n = sum(presence), 
            perc = round(n / nrow(bob_ross), 2)) %>%
  filter(perc >= .02) %>%
  mutate(perc = paste0(perc*100, "%")) %>%
  arrange(desc(n)) %>%
  ggplot(aes(reorder(feature,n), n, label = perc)) +
  geom_bar(stat = "identity", fill = "dodgerblue3") +
  geom_text(nudge_y = 12) +
  coord_flip() +
  theme_fivethirtyeight()