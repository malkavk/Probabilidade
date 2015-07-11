library(HyperbolicDist)

set.seed(12345)
par(mfrow = c(1,3))
Theta2 <- c(alpha=1,beta=2,delta=1,mu=0)

dataVector <- rhyperb(500, Theta2)
curve(dhyperb(x, Theta2), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram\n of the Hyperbolic Distribution")
############
logHist(dataVector, main =
          "Log-Density and Log-Histogram\n of the Hyperbolic Distribution")
curve(log(dhyperb(x, Theta2)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
##############
curve(phyperb(x, Theta2), from = range(dataVector)[1], to = range(dataVector)[2],
      n = 1000)
title("Distribution Function of the\n Hyperbolic Distribution")
