here::i_am("code/01makefigure.R")

communityattendancelevel <- read.csv(
  file = here::here("csv-datasets/community_attendance_DATA550.csv")
)

library(ggplot2)

figure <- ggplot(communityattendancelevel, aes(x = Session_No.,)) +
  geom_line(aes(y = Iponyabugali, color = "Igumamoyo"), linewidth = 1) + 
  geom_line(aes(y = Igumamoyo, color = "Iponyabugali"), linewidth = 1) +
  geom_line(aes(y = Nyamwilolelwa, color = "Nyamwilolelwa"), linewidth = 1) +
  geom_line(aes(y = Kisundi, color = "Kisundi"), linewidth = 1) +
  geom_line(aes(y = Kabangaja, color = "Kabangaja"), linewidth = 1) + 
  geom_line(aes(y = Buganda, color = "Buganda"), linewidth = 1) + 
  labs(x = "Session Number", y = "Number of Fathers at Session", title = "Figure 1: Number of Fathers at Each Session in Each Community") +
  theme_minimal()

saveRDS(
  figure,
  file = here::here("outputs/figure.rds")
)
