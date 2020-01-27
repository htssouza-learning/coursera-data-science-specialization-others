
# ravens data
file.url <- "https://raw.githubusercontent.com/bcaffo/courses/master/07_RegressionModels/03_02_binaryOutcomes/data/ravensData.rda"
file.destination <- "~/Downloads/ravensData.rda"
download.file(url = file.url,
              destfile = file.destination,
              method = "curl")
load(file.destination)

# lm
fit <- lm(ravenWinNum ~ ravenScore, data = ravensData)
summary(fit)$coef

# distribution
library(manipulate)
x <- seq(-10, 10, length = 1000)
manipulate(
    plot(x, exp(beta0 + beta1 * x) / (1 + exp(beta0 + beta1 * x)),
         type ="l", lwd = 3, frame = FALSE),
    beta1 = slider(-2, 2, step = .1, initial = 2),
    beta0 = slider(-2, 2, step = -1, initial = 0)
)

# gbl
logRegRavens <- glm(ravenWinNum ~ ravenScore,
                    data = ravensData,
                    family = "binomial")
summary(logRegRavens)

plot(ravensData$ravenScore,
     logRegRavens$fitted,
     pch = 19,
     col = "blue",
     xlab = "Score",
     ylab = "Prob Ravens Win")

exp(logRegRavens$coeff)
exp(confint(logRegRavens))

anova(logRegRavens, test = "Chisq")
logRegRavens

par(mfrow = c(1, 3))
plot(0 : 10, dpois(0 : 10, lambda = 2), type = "h", frame = FALSE)
plot(0 : 20, dpois(0 : 20, lambda = 10), type = "h", frame = FALSE)
plot(0 : 200, dpois(0 : 200, lambda = 100), type = "h", frame = FALSE)

file.url <- "https://raw.githubusercontent.com/bcaffo/courses/master/07_RegressionModels/03_03_countOutcomes/data/gaData.rda"
file.destination <- "~/Downloads/gaData.rda"
download.file(url = file.url,
              destfile = file.destination,
              method = "curl")
load(file.destination)
gaData$julian <- julian(gaData$date)
head(gaData)

par(mfrow = c(1, 1))
plot(gaData$julian, gaData$visits, pch = 19, col = "darkgrey", xlab = "Julian", ylab = "Visits")
lm1 <- lm(visits ~ julian, data = gaData)
abline(lm1, col = "red", lwd = 3)
glm1 <- glm(visits ~ julian, data = gaData, family = "poisson")
lines(gaData$julian, glm1$fitted, col = "blue", lwd = 3)

plot(glm1$fitted, glm1$residuals, pch = 19, col = "grey", ylab = "Residuals", xlab = "Fitted")
