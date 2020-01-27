# 1
data(mtcars)
mtcars$cylasfactor <- as.factor(mtcars$cyl)
fit <- lm(mpg ~ cylasfactor + wt, data = mtcars)
summary(fit)$coef

mpg1 <- predict(fit, data.frame(cylasfactor = as.factor(4), wt = mean(mtcars$wt)))
mpg2 <- predict(fit, data.frame(cylasfactor = as.factor(8), wt = mean(mtcars$wt)))
mpg2 - mpg1        

# 2
fit2 <- lm(mpg ~ factor(cyl), data = mtcars)
cyl.8 <- data.frame(summary(fit)$coef[3], summary(fit2)$coef[3]); names(cyl.8) = c("with wt", "no wt"); rownames(cyl.8) = "cyl 8 Est."
print(cyl.8)

# Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.

# 3
fit3 <- lm(mpg ~ factor(cyl) + wt, data = mtcars)
fit4 <- lm(mpg ~ factor(cyl)*wt, data = mtcars)
anova(fit3, fit4)

# The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms may not be necessary.

# 4
fit5 <- lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
summary(fit5)$coef

# The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders(4, 6, 8).

# 5
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

x = c(0.586, 0.166, -0.042, -0.614, 11.72)
y = c(0.549, -0.026, -0.127, -0.751, 1.344)

fit6 = lm(y ~ x)
hatvalues(fit6)[which.max(abs(hatvalues(fit6)))]

# 6
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

fit7 = lm(y ~ x)
influence.measures(fit7)$infmat[which.max(abs(influence.measures(fit7)$infmat[, 2])), 2]

# 7
# It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment.
