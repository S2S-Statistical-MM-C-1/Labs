#farmer has used fertiliser or not and measured potato yield and wheat yield

set.seed(1989)

pot_fert <- round(rnorm(n = 130, mean = 39, sd = 4), 3)
pot_nofert <- round(rnorm(n = 80, mean = 39, sd = 4), 3)

wheat_fert <- round(rnorm(n = 90, mean = 24, sd = 3), 3)
wheat_nofert <- round(rnorm(n = 120, mean = 18, sd = 1), 3)

yields <- data.frame(fertiliser = rep(c("Used", "Not used", "Used", "Not used"), times = c(130, 80, 90, 120)), 
                     crop = rep(c("potato", "wheat"), each = 210),
                     yield = c(pot_fert, pot_nofert, wheat_fert, wheat_nofert)#,
                     #supermarket = sample(c(0, 1), 420, replace = TRUE, prob = c(0.65, 0.35))
                     )
yields <- yields[c(sample(1:210), sample(211:420)), ]
row.names(yields) <- 1:nrow(yields)

write.csv(x = yields, file = "data/yields_long.csv", row.names = FALSE)

