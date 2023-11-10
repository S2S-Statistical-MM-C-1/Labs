#farmer has used fertiliser or not and measured potato yield and lettuce yield

set.seed(1989)

lettuce_fert <- rnorm(n = 13, mean = 24, sd = 3)
lettuce_nofert <- rnorm(n = 8, mean = 18, sd = 1)

pot_fert <- rnorm(n = 13, mean = 39, sd = 4)
pot_nofert <- rnorm(n = 8, mean = 35, sd = 4)

yields <- data.frame(fertiliser = rep(c("Used", "Not used"), times = c(13, 8)),
                     potato = c(pot_fert, pot_nofert),
                     lettuce = c(lettuce_fert, lettuce_nofert))
yields <- yields[sample(nrow(yields)), ]
row.names(yields) <- 1:nrow(yields)

write.csv(x = yields, file = "Data/yields.csv", row.names = FALSE)
