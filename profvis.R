library(profvis)
library(tidyverse)
library(fivethirtyeight)

mylm <- function(dat, pred, resp, qqplot = FALSE) {
  
  stopifnot(inherits(dat, "data.frame"))
  
  if (is.tibble(dat)) {
    
    dat <- as.data.frame(dat)
    
  }
  
  fit <- lm(dat[,pred] ~ dat[,resp])
  
  cat("coefficients are ...\n",fit$coefficients)
  
  plot(dat[,pred], dat[,resp])
  
}

# run these lines
# use keyboard shortcut (option + command + shift + p on MAC) to run and profile the lines
mylm(dat = mtcars, pred = "wt", resp = "mpg")
mylm(dat = congress_age, pred = "congress", resp = "age")

# alterantively wrap in profvis() function
profvis(mylm(dat = mtcars, pred = "wt", resp = "mpg"))
profvis(mylm(dat = congress_age, pred = "congress", resp = "age"))
