# 350 stats students & year of study (1st year and 2nd year)
# randomly allocate whether students are on the naughty list or not

set.seed(11070)
naughty <- c(sample(0:1, 184, replace = TRUE, prob = c(0.74, 0.26)),
             sample(0:1, 126, replace = TRUE, prob = c(0.81, 0.19)))
level <- rep(c("Level 1", "Level 2"), times = c(184, 126))

stats_list <- data.frame(naughty, level)

write.csv(stats_list, file = "Data/stats_list.csv", row.names = FALSE)
