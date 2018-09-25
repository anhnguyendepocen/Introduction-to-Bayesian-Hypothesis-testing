set.seed(20180921)
smpl <- rbinom(1000, 1, 0.5)
heads <- cumsum(smpl)/(1:1000)
plot(1:1000, heads, type='l', xlab="Number of flips", ylab="Proportion of Heads", lwd=2)
abline(h=0.5, lty=2, lwd=1.5)


set.seed(20180921)
smpl <- rbinom(1500, 1, 0.55)
sum(smpl)
write.csv(cbind(toss=1:100, heads=smpl[1:100]), file="data/coin_toss.csv", row.names = FALSE)
write.csv(cbind(toss=1:1500, heads=smpl), file="data/coin_toss_large.csv", row.names = FALSE)
