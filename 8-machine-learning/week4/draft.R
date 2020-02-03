# stacking
# ensemble
library(caret)
library(ggplot2)
library(ISLR)
data(Wage)
Wage <- subset(Wage, select=-c(logwage))

inBuild <- createDataPartition(y = Wage$wage,
                               p = 0.7,
                               list = FALSE)
validation <- Wage[-inBuild, ]
buildData <- Wage[inBuild, ]

inTrain <- createDataPartition(y = buildData$wage,
                               p = 0.7,
                               list = FALSE)
training <- buildData[inTrain, ]
testing <- buildData[-inTrain, ]

mod1 <- train(wage ~ ., method = "glm", data = training)
mod2 <- train(wage ~ ., method = "rf", data = training, trControl = trainControl(method="cv"), number = 3)

pred1 <- predict(mod1, testing)
pred2 <- predict(mod2, testing)
qplot(pred1, pred2, colour = wage, data = testing)

# residual
pred1res <- testing$wage - pred1
pred2res <- testing$wage - pred2
ggplot(data = testing) +
    geom_line(aes(x=wage, y=pred1res), color="blue") + 
    geom_line(aes(x=wage, y=pred2res), color="green") +
    geom_hline(yintercept = 0)

predDF <- data.frame(pred1, pred2, wage=testing$wage)
combModFit <- train(wage ~ ., method = "gam", data = predDF)
combPred <- predict(combModFit, predDF)

sqrt(sum((pred1 - testing$wage) ^ 2))
sqrt(sum((pred2 - testing$wage) ^ 2))
sqrt(sum((combPred - testing$wage) ^ 2))

pred1V <- predict(mod1, validation)
pred2V <- predict(mod2, validation)
predVDF <- data.frame(pred1 = pred1V, pred2 = pred2V)
combPredV <- predict(combModFit, predVDF)

sqrt(sum((pred1V - validation$wage) ^ 2))
sqrt(sum((pred2V - validation$wage) ^ 2))
sqrt(sum((combPredV - validation$wage) ^ 2))

# forecast
library(forecast)
library(quantmod)
from.date <- as.Date("01/01/08", format = "%m/%d/%y")
to.date <- as.Date("12/31/13", format = "%m/%d/%y")
getSymbols("GOOG", src="yahoo", from = from.date, to = to.date)
head(GOOG)

mGOOG <- to.monthly(GOOG)
googOpen <- Op(mGOOG)
ts1 <- ts(googOpen, frequency = 12)
plot(ts1)

plot(decompose(ts1))

ts1Train <- window(ts1, start = 1, end = 5)
ts1Test <- window(ts1, start = 5, end = (7 - 0.01))

ets1 <- ets(ts1Train, model = "MMM")
fcast <- forecast(ets1)
plot(fcast)
lines(ts1Test, col="red")

# unsupervised
data(iris)
inTrain <- createDataPartition(y = iris$Species,
                               p = 0.7,
                               list = FALSE)
training <- iris[inTrain, ]
testing <- iris[-inTrain, ]
kMeans1 <- kmeans(subset(training, select=-c(Species)), centers = 3)
training$clusters <- as.factor(kMeans1$cluster)
qplot(Petal.Width, Petal.Length, color = clusters, data = training)

table(kMeans1$cluster, training$Species)
