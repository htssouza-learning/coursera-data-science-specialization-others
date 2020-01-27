set.seed(123456)
n <- 100
x1 <- rnorm(n)
x2 <- rnorm(n)
x3 <- rnorm(n)
y <- 1 + x1 + x2 + x3 + rnorm(n, sd = 0.1)
ey <- resid(lm(y ~ x2 + x3))
ex1 <- resid(lm(x1 ~ x2 + x3))
sum(ey * ex1) / sum(ex1 ^ 2)
coef(lm(y ~ x1 + x2 + x3))

require(datasets)
require(GGally)
require(ggplot2)
data(swiss)
ggpairs(swiss, lower = list(continuous = wrap("smooth", method = "lm")))

require(datasets)
require(stats)
g <- ggplot(data = InsectSprays, aes(y = count, x = spray, fill = spray))
g <- g + geom_violin(color = "black", size = 2)
g <- g + xlab("Type of spray")
g <- g + ylab("Insect count")
g

fit <- lm(count ~ spray, data = InsectSprays)
summary(fit)$coef

swiss$CatholicBin <- 1 * (swiss$Catholic > 50) 
fit <- lm(Fertility ~ Agriculture, data = swiss)
g <- ggplot(data = swiss, aes(x = Agriculture, y = Fertility, color = factor(swiss$CatholicBin)))
g <- g + geom_point(size = 2)
g <- g + geom_abline(intercept = coef(fit)[1], slope = coef(fit)[2], size = 2)
g

fit <- lm(Fertility ~ Agriculture + factor(swiss$CatholicBin), data = swiss)
summary(fit)

data(swiss)
par(mfrow = c(2, 2))
fit <- lm(Fertility ~ ., data = swiss)
plot(fit)

par(mfrow = c(1, 1))
n <- 100
x <- c(10, rnorm(n))
y <- c(10, rnorm(n))
plot (x, y, frame = FALSE, cex = 2, pch = 21, bg = "lightblue", col = "black")
fit <- lm(y ~ x)
abline(fit)
par(mfrow = c(2, 2))
plot(fit)

n <- 100
nosim <- 1000
x1 <- rnorm(n)
x2 <- rnorm(n)
x3 <- rnorm(n)
betas <- sapply(1 : nosim, function(i){
  y <- x1 + rnorm(n, sd = .3)
  c(coef(lm(y ~ x1))[2],
    coef(lm(y ~ x1 + x2))[2],
    coef(lm(y ~ x1 + x2 + x3))[2])
})
round(apply(betas, 1, sd), 5)

n <- 100
nosim <- 1000
x1 <- rnorm(n)
x2 <- x1/sqrt(2) + rnorm(n) / sqrt(2)
x3 <- x1 * 0.95 + rnorm(n) * (sqrt(1 - 0.95 ^ 2))
betas <- sapply(1 : nosim, function(i){
    y <- x1 + rnorm(n, sd = .3)
    c(coef(lm(y ~ x1))[2],
      coef(lm(y ~ x1 + x2))[2],
      coef(lm(y ~ x1 + x2 + x3))[2])
})
round(apply(betas, 1, sd), 5)
y <- x1 + rnorm(n, sd = .3)
fit <- lm(y ~ x1)
summary(fit)

install.packages("car")
library(car)
data(swiss)
fit <- lm(Fertility ~ ., data = swiss)
vif(fit)
sqrt(vif(fit))

data(swiss)
fit1 <- lm(Fertility ~ Agriculture, data = swiss)
fit3 <- update(fit1, Fertility ~ Agriculture + Examination + Education, data = swiss)
fit5 <- update(fit1, Fertility ~ Agriculture + Examination + Education + Catholic + Infant.Mortality, data = swiss)
anova(fit1, fit3, fit5)
