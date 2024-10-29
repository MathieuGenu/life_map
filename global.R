if(!("pacman" %in% installed.packages())) {
  install.packages("pacman")
}
library(pacman)
p_load(tidyverse,htmltools,shiny,sf,leaflet,reactable,timevis)

info <- read_csv2("data/infos.csv") %>%
  mutate(name = case_when(
    str_detect(location,"IFREMER") ~ "IFREMER",
    str_detect(location,"Agro") ~ "AGRO",
    str_detect(location,"Rennes 1") ~ "RENNES1",
    str_detect(location,"pelagis") ~ "PELAGIS"
  )) %>%
  mutate(name = as.factor(name)) %>%
  mutate(start = dmy(start),
         end = dmy(end))


data <- info %>%
  select(id:end)


# data <- data.frame(
#   id      = 1:6,
#   group  = c(1,1,3,3,2,2),
#   content = c(
#     "Bachelor degree", "Master degree",
#     "Internship1", "Master's Internship",
#     "Research engineer", "Research engineer"
#   ),
#   start   = c(
#     "2011-09-01", "2015-09-01",
#     "2016-04-01", "2017-02-01",
#     "2018-02-01","2019-09-14"
#   ),
#   end     = c(
#     "2014-05-31", "2017-09-09",
#     "2016-08-31", "2017-08-15",
#     "2018-12-31","2024-12-31"
#   )
# )

# data %>%
#   write_csv2(file = "data/infos.csv")

# ICONS
logoIcons <- iconList(
  IFREMER = makeIcon(
    info %>% filter(str_detect(location,"IFREMER")) %>% pull(icon) %>% unique(),
    iconWidth = 45,
    iconHeight = 18
  ),
  AGRO = makeIcon(
    info %>% filter(str_detect(location,"Agro")) %>% pull(icon) %>% unique(),
    iconWidth = 32,
    iconHeight = 24
  ),
  RENNES1 = makeIcon(
    info %>% filter(str_detect(location,"Rennes 1")) %>% pull(icon) %>% unique(),
    iconWidth = 36,
    iconHeight = 18
  ),
  PELAGIS = makeIcon(
    info %>% filter(str_detect(location,"pelagis")) %>% pull(icon) %>% unique(),
    iconWidth = 32,
    iconHeight = 24
  )
)


groups <- data.frame(
  id = c(1,2,3,4),
  content = c("Academic","Professionnal experience",
              "Internship","Conference")
)

