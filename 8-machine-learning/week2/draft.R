library(ISLR)
library(caret)
data(Wage)
inTrain <- createDataPartition(y = Wage$wage,
                               p = 0.7,
                               list = FALSE)
training <- Wage[inTrain, ]
testing <- Wage[-inTrain,]

table(training$jobclass)
dummies <- dummyVars(wage ~ jobclass, data = training)
head(predict(dummies, newdata = training))

nzv <- nearZeroVar(training, saveMetrics = TRUE)
nzv <- nearZeroVar(training)

library(splines)
bsBasis <- bs(training$age, df = 3)
bsBasis

lm1 <- lm(wage ~ bsBasis, data = training)
plot(training$age, training$wage, pch = 19, cex = 0.5)
points(training$age, predict(lm1, newdata = training), col = "red", pch = 19, cex = 0.5)

predict(bsBasis, age = testing$age)

# PCA
library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y = spam$type,
                               p = 0.75,
                               list = FALSE)
training <- spam[inTrain, ]
testing <- spam[-inTrain,]

M <- abs(cor(training[, -58]))
diag(M) <- 0
which(M > 0.8, arr.ind = TRUE)
names(spam[c(34, 32)])
plot(spam[,34], spam[,32])

smallSpam <- spam[, c(34, 32)]
prComp <- prcomp(smallSpam)
plot(prComp$x[, 1], prComp$x[, 2])
View(prComp$x)

prComp$rotation

typeColor <- ((spam$type == "spam") * 1 + 1)
prComp <- prcomp(log10(spam[, -58] + 1))
plot(prComp$x[,1], prComp$x[,2], col=typeColor)

preProc <- preProcess(log10(spam[,-58]+1), method="pca", pcaComp = 2)
spamPC <- predict(preProc, log10(spam[,-58]+1))
plot(spamPC[,1], spamPC[,2], col=typeColor)


library(e1071)
library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y = spam$type,
                               p = 0.75,
                               list = FALSE)
training <- spam[inTrain, ]
testing <- spam[-inTrain,]

# option 1
preProc <- preProcess(log10(training[,-58]+1), method="pca", pcaComp = 2)
trainPC <- predict(preProc, log10(training[,-58]+1))
modelFit <- train(training$type ~ ., method="glm", data = trainPC)

# option 2
modelFit <- train(type ~ ., method = "glm", preProcess="pca", data = training)
confusionMatrix(testing$type, predict(modelFit, testing))
