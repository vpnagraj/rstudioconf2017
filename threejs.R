library(threejs)
library(outbreaks)

# prep edge attributes
hospvisit <- 
  mers.korea.2015$contacts %>%
  filter(exposure == "Visit hospital") %>%
  select(from,to)

# prep node attributes
hospvisitll <-
  mers.korea.2015$linelist %>%
  filter(id %in% hospvisit$from | id %in% hospvisit$to) %>%
  select(id)

# create graph object from data frame
g <- graph_from_data_frame(hospvisit, vertices = hospvisitll)

# remove edges from graph
gnoe <- g - edges(1:12)

# make list of graphs
graph_list <- list(gnoe,
                   gnoe + edge(ends(g, es = E(g), names = FALSE)[1,]), 
                   gnoe + edge(ends(g, es = E(g), names = FALSE)[1,]) + edge(ends(g, es = E(g), names = FALSE)[2,]),
                   gnoe + edge(ends(g, es = E(g), names = FALSE)[1,]) + edge(ends(g, es = E(g), names = FALSE)[2,]) +  edge(ends(g, es = E(g), names = FALSE)[3,]),
                   gnoe + edge(ends(g, es = E(g), names = FALSE)[1,]) + edge(ends(g, es = E(g), names = FALSE)[2,]) +  edge(ends(g, es = E(g), names = FALSE)[3,]) + edge(ends(g, es = E(g), names = FALSE)[4,])
)

# plot graphs                   
graphjs(graph_list,
        vertex.shape="sphere", 
        vertex.label = names(V(gnoe)),
        edge.width=3)