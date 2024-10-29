if(!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
library(pacman)
p_load(tidyverse,shiny,sf,leaflet,reactable,timevis)


data <- data.frame(
  id      = 1:4,
  group  = c(1,1,3,3),
  content = c("Bachelor degree", "Master degree",
              "Internship1", "Master's Internship"),
  start   = c("2011-09-01", "2016-09-01",
              "2016-04-01", "2017-02-01"),
  end     = c("2014-05-31", "2017-09-09",
              "2016-08-31", "2017-08-15")
)


groups <- data.frame(
  id = c(1,2,3,4),
  content = c("Academic","Professionnal experience",
              "Internship","Conference")
)
