# 1

library(caret)
library(AppliedPredictiveModeling)
data(segmentationOriginal)

inTrain <- createDataPartition(y = segmentationOriginal$Case,
                               p = 0.75,
                               list = FALSE)
training <- segmentationOriginal[inTrain, ]
testing <- segmentationOriginal[-inTrain,]
set.seed(125)

model <- train(Case ~ ., method = "rpart", data = training)

library(ggplot2)
suppressMessages(library(rattle))
library(rpart.plot)
rattle::fancyRpartPlot(model$finalModel)

# 3
library(pgmm)
data(olive)
olive = olive[,-1]

inTrain <- createDataPartition(y = olive$Area,
                               p = 0.75,
                               list = FALSE)
training <- olive[inTrain, ]
testing <- olive[-inTrain,]

model <- train(Area ~ ., method = "rpart", data = training)

newdata = as.data.frame(t(colMeans(olive)))
predict(model, newdata)

# 4

library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]



