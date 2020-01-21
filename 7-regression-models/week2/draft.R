library(ggplot2)
library(UsingR)
data(diamond)
carat <- diamond$carat
price <- diamond$price

g <- ggplot(data.frame(x = carat, y = price), aes(x = x, y = y))
g <- g + geom_point(size = 5, alpha = 0.2, color = "blue")
g <- g + geom_point(size = 6, alpha = 0.2, color = "black")
g <- g + geom_smooth(method = "lm", color = "black")
g

fit <- lm(price ~ carat)
e <- resid(fit)
pricehat <- predict(fit)
resid <- price - pricehat

g <- ggplot(data.frame(x = price, y = resid), aes(x = x, y = y))
g <- g + geom_hline(yintercept = 0, size = 2)
g <- g + geom_col(size = 0.5, color = "red")
g <- g + geom_point(size = 2, color = "black")
g <- g + geom_point(size = 1, color = "white")
g <- g + geom_smooth(method = "auto")
g
