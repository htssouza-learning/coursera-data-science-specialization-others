# 2
library(caret)
library(gbm)
library(AppliedPredictiveModeling)

set.seed(3433)

data(AlzheimerDisease)

adData = data.frame(diagnosis,predictors)

inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]

training = adData[ inTrain,]

testing = adData[-inTrain,]

set.seed(62433)

mod1 <- train(diagnosis ~ ., method = "rf", data = training)
mod2 <- train(diagnosis ~ ., method = "gbm", data = training, verbose = FALSE)
mod3 <- train(diagnosis ~ ., method = "lda", data = training)

pred1 <- predict(mod1, training)
pred2 <- predict(mod2, training)
pred3 <- predict(mod3, training)

dataS <- data.frame(pred1, pred2, pred3, diagnosis=training$diagnosis)
modS <- train(diagnosis ~ ., method = "rf", data = dataS, trControl = trainControl(method="cv"), number = 3)

predS <- predict(modS, training)

confusionMatrix(pred1, training$diagnosis)$overall['Accuracy']
confusionMatrix(pred2, training$diagnosis)$overall['Accuracy']
confusionMatrix(pred3, training$diagnosis)$overall['Accuracy']
confusionMatrix(predS, training$diagnosis)$overall['Accuracy']

