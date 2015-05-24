# CodeBook

## Introduction

This code book will provide you with details about the structure of the result tidy data file.

The documentation of the experiment behind the data and where to get the raw files are in the following url:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Variables (Columns)

The tidy data set contains the following variables:

| Variable | Type | Description |
| -------- | :--: | ----------- |
| subject | int | Id of the subject (person that participated on the experiment) |
| activity | factor | Details below (note 1) |
| tBodyAcc-mean()-X-mean() | numeric | Details below (note 2) |
| tBodyAcc-mean()-Y-mean() | numeric | Details below (note 2) |
| tBodyAcc-mean()-Z-mean() | numeric | Details below (note 2) |
| tGravityAcc-mean()-X-mean() | numeric | Details below (note 2) |
| tGravityAcc-mean()-Y-mean() | numeric | Details below (note 2) |
| tGravityAcc-mean()-Z-mean() | numeric | Details below (note 2) |
| tBodyAccJerk-mean()-X-mean() | numeric | Details below (note 2) |
| tBodyAccJerk-mean()-Y-mean() | numeric | Details below (note 2) |
| tBodyAccJerk-mean()-Z-mean() | numeric | Details below (note 2) |
| tBodyGyro-mean()-X-mean() | numeric | Details below (note 2) |
| tBodyGyro-mean()-Y-mean() | numeric | Details below (note 2) |
| tBodyGyro-mean()-Z-mean() | numeric | Details below (note 2) |
| tBodyGyroJerk-mean()-X-mean() | numeric | Details below (note 2) |
| tBodyGyroJerk-mean()-Y-mean() | numeric | Details below (note 2) |
| tBodyGyroJerk-mean()-Z-mean() | numeric | Details below (note 2) |
| tBodyAccMag-mean()-mean() | numeric | Details below (note 2) |
| tGravityAccMag-mean()-mean() | numeric | Details below (note 2) |
| tBodyAccJerkMag-mean()-mean() | numeric | Details below (note 2) |
| tBodyGyroMag-mean()-mean() | numeric | Details below (note 2) |
| tBodyGyroJerkMag-mean()-mean() | numeric | Details below (note 2) |
| fBodyAcc-mean()-X-mean() | numeric | Details below (note 2) |
| fBodyAcc-mean()-Y-mean() | numeric | Details below (note 2) |
| fBodyAcc-mean()-Z-mean() | numeric | Details below (note 2) |
| fBodyAcc-meanFreq()-X-mean() | numeric | Details below (note 2) |
| fBodyAcc-meanFreq()-Y-mean() | numeric | Details below (note 2) |
| fBodyAcc-meanFreq()-Z-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-mean()-X-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-mean()-Y-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-mean()-Z-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-meanFreq()-X-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-meanFreq()-Y-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-meanFreq()-Z-mean() | numeric | Details below (note 2) |
| fBodyGyro-mean()-X-mean() | numeric | Details below (note 2) |
| fBodyGyro-mean()-Y-mean() | numeric | Details below (note 2) |
| fBodyGyro-mean()-Z-mean() | numeric | Details below (note 2) |
| fBodyGyro-meanFreq()-X-mean() | numeric | Details below (note 2) |
| fBodyGyro-meanFreq()-Y-mean() | numeric | Details below (note 2) |
| fBodyGyro-meanFreq()-Z-mean() | numeric | Details below (note 2) |
| fBodyAccMag-mean()-mean() | numeric | Details below (note 2) |
| fBodyAccMag-meanFreq()-mean() | numeric | Details below (note 2) |
| fBodyBodyAccJerkMag-mean()-mean() | numeric | Details below (note 2) |
| fBodyBodyAccJerkMag-meanFreq()-mean() | numeric | Details below (note 2) |
| fBodyBodyGyroMag-mean()-mean() | numeric | Details below (note 2) |
| fBodyBodyGyroMag-meanFreq()-mean() | numeric | Details below (note 2) |
| fBodyBodyGyroJerkMag-mean()-mean() | numeric | Details below (note 2) |
| fBodyBodyGyroJerkMag-meanFreq()-mean() | numeric | Details below (note 2) |
| tBodyAcc-std()-X-mean() | numeric | Details below (note 2) |
| tBodyAcc-std()-Y-mean() | numeric | Details below (note 2) |
| tBodyAcc-std()-Z-mean() | numeric | Details below (note 2) |
| tGravityAcc-std()-X-mean() | numeric | Details below (note 2) |
| tGravityAcc-std()-Y-mean() | numeric | Details below (note 2) |
| tGravityAcc-std()-Z-mean() | numeric | Details below (note 2) |
| tBodyAccJerk-std()-X-mean() | numeric | Details below (note 2) |
| tBodyAccJerk-std()-Y-mean() | numeric | Details below (note 2) |
| tBodyAccJerk-std()-Z-mean() | numeric | Details below (note 2) |
| tBodyGyro-std()-X-mean() | numeric | Details below (note 2) |
| tBodyGyro-std()-Y-mean() | numeric | Details below (note 2) |
| tBodyGyro-std()-Z-mean() | numeric | Details below (note 2) |
| tBodyGyroJerk-std()-X-mean() | numeric | Details below (note 2) |
| tBodyGyroJerk-std()-Y-mean() | numeric | Details below (note 2) |
| tBodyGyroJerk-std()-Z-mean() | numeric | Details below (note 2) |
| tBodyAccMag-std()-mean() | numeric | Details below (note 2) |
| tGravityAccMag-std()-mean() | numeric | Details below (note 2) |
| tBodyAccJerkMag-std()-mean() | numeric | Details below (note 2) |
| tBodyGyroMag-std()-mean() | numeric | Details below (note 2) |
| tBodyGyroJerkMag-std()-mean() | numeric | Details below (note 2) |
| fBodyAcc-std()-X-mean() | numeric | Details below (note 2) |
| fBodyAcc-std()-Y-mean() | numeric | Details below (note 2) |
| fBodyAcc-std()-Z-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-std()-X-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-std()-Y-mean() | numeric | Details below (note 2) |
| fBodyAccJerk-std()-Z-mean() | numeric | Details below (note 2) |
| fBodyGyro-std()-X-mean() | numeric | Details below (note 2) |
| fBodyGyro-std()-Y-mean() | numeric | Details below (note 2) |
| fBodyGyro-std()-Z-mean() | numeric | Details below (note 2) |
| fBodyAccMag-std()-mean() | numeric | Details below (note 2) |
| fBodyBodyAccJerkMag-std()-mean() | numeric | Details below (note 2) |
| fBodyBodyGyroMag-std()-mean() | numeric | Details below (note 2) |
| fBodyBodyGyroJerkMag-std()-mean() | numeric | Details below (note 2) |

### Note 1

Activity may contain one of the following values:

| Level | Label |
| :---: | ----- |
| 1 | WALKING |
| 2 | WALKING_UPSTAIRS |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING |
| 5 | STANDING |
| 6 | LAYING |

### Note 2

Each one of these variables contain the mean of the underlaying variable
on the raw data, per subject, per label.

Example:
**fBodyGyro-std()-Z-mean()** contains the mean of the variable **fBodyGyro-std()**
for the associated subject and activity.
