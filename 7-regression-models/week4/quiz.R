# 1
library(MASS)
data(shuttle)
shuttle$usebin <- as.integer(as.factor(shuttle$use)) - 1

fit <- glm(usebin ~ wind, data = shuttle, family = "binomial")
exp(coef(fit))

# 2
exp(coef(fit))[[1]]/exp(coef(fit))[[2]]

# 3
# The coefficients reverse their signs.

# 4
data(InsectSprays)
fit2 <- glm(count ~ spray -1, data = InsectSprays, family = "poisson")
summary(fit2)$coef

coefs <- exp(coef(fit2))
coefs[[1]]/coefs[[2]]

# 5
# The coefficient estimate is unchanged.

# 6 
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)

plot(x, y, pch = 21,  cex = 2, col = "grey", bg = "blue")

knots <- 0
splineTerms <- sapply(knots, function(knot) (x > knot) * (x - knot))
xmat <- cbind(1, x, splineTerms)
fit3 <- lm(y ~ xmat - 1)
yhat<-predict(fit3)
lines(x, yhat, col = "red", lwd = 2)
sum(coef(fit3)[2:3])



                                   