# 1
x <- c(0.18, -1.54, 0.42, 0.95)
w <- c(2, 1, 3, 1)
sum(w * x) / sum(w)

# 2
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
beta <- 10 * 1:10000 / 10000
distance <- sapply(beta, function(b) {sum((y - b*x) ^ 2)} )
data <- data.frame(beta, distance)
data <- data[order(data$distance),]
head(data)

# 3
data(mtcars)
coef(lm(mpg ~ wt, mtcars))[2]

# 4
correlation <- 0.5
sdy <- 2
sdx <- 1
beta <- correlation * sdy / sdx
beta

# 5 
1.5 * 0.4

# 6
x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
(x[1] - mean(x)) / sd(x)

# 7
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)
lm(y ~ x)

# 8
# It must be identicallu 0.

# 9
x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
mean(x)

# 10
# Var(Y) / Var(X)

