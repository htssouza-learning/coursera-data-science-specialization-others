# 1
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
coefTable <- coef(summary(fit))
(pval <- coefTable[2, 4])
pval

# 2
summary(fit)$sigma

# 3
data(mtcars)
y <- mtcars$mpg
x <- mtcars$wt
fit <- lm(y ~ x)
predict(fit, newdata = data.frame(x = mean(x)), interval = ("confidence"))

# 4
# The estimated expected change in mpg per 1,000 lb increase in weight.

# 5
predict(fit, newdata = data.frame(x = 3), interval = ("prediction"))

# 6
fit2 <- lm(y ~ I(x/2))
sumCoef2 <- coef(summary(fit2))
(sumCoef2[2,1] + c(-1, 1) * qt(.975, df = fit2$df) * sumCoef2[2, 2])

# 7
# multiplied by 100



