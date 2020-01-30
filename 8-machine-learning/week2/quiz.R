# 1

library(AppliedPredictiveModeling)
data(AlzheimerDisease)

# option
adData = data.frame(diagnosis,predictors)
trainIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[trainIndex,]
testing = adData[-trainIndex,]

# 2
library(AppliedPredictiveModeling)
library(caret)
library(dplyr)
library(Hmisc)

data(concrete)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

training$index <- 1:length(training$CompressiveStrength)

features <- names(select(training, -index, -CompressiveStrength))
for(feature in features) {
    featureGroups <- 10
    featureColor <- cut2(as.numeric(training[, feature]), g = featureGroups)
    print(qplot(x = training$index,
          y = training$CompressiveStrength,
          col = featureColor,
          main = feature))
} 

# There is non-random pattern...

# 3
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

ggplot(data = training,
       aes(x = log(Superplasticizer + 1), y = CompressiveStrength)) +
    geom_point()

ggplot(data = training, aes(x = log(Superplasticizer))) +
    geom_histogram(bins = 30)

ggplot(data = training, aes(x = Superplasticizer)) +
    geom_histogram(bins = 30)

# There are values of zero

# 4
library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

features <- names(training)[grep("^IL.*", names(training))]
smallTraining <- select(training, features)
trainingPP <- preProcess(smallTraining, method="pca", thresh = 80/100)

# answer: 7

# 5

library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

training_IL <- training[c("diagnosis", names(training)[grep("^IL",colnames(training))])]
testing_IL <- testing[c("diagnosis", names(testing)[grep("^IL",colnames(testing))])]

# model 1
model1 <- train(diagnosis ~ ., method="glm", data=training_IL)
confusionMatrix(testing_IL$diagnosis, predict(model1, testing_IL)) ## Accuracy : 0.7561

# model 2
preProc <- preProcess(training_IL[, -1], method=c("center", "scale", "pca"), thresh=0.8) ## 9 columns
trainPC <- predict(preProc, training_IL) ## 10 columns
testPC <- predict(preProc, testing_IL)   ## 10 columns
model2 <- train(diagnosis ~ ., method="glm", data=trainPC)
confusionMatrix(testing_IL$diagnosis, predict(model2, testPC)) ## Accuracy : 0.7195




    