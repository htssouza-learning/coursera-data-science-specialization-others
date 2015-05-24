############################################################################
# Coursera Programming Assignment
# Johns Hopkins University (Data Science Specialization)
# Getting & Cleaning Data Course
############################################################################

############################################################################
# Goals for this script
# You should create one R script called run_analysis.R that does the
# following.
#
# 1-) Merges the training and the test sets to create one data set.
# 2-) Extracts only the measurements on the mean and standard deviation for
# each measurement.
# 3-) Uses descriptive activity names to name the activities in the data set
# 4-) Appropriately labels the data set with descriptive variable names.
# 5-) From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject.

############################################################################
# Debugging constants
SKIP_DOWNLOAD_PROCESS <- FALSE

############################################################################
# Constants (change may be required for your own environment)

WORKING_DIRECTORY <- "~/git/coursera-jhu-getdata"
DEST_FILE_PATH <- "raw.zip"
RESULT_FILE_PATH <- "result.txt"

SOURCE_FILE_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

FEATURE_LABELS_PATH <- "UCI HAR Dataset/features.txt"
ACTIVITY_LABELS_PATH <- "UCI HAR Dataset/activity_labels.txt"

TRAIN_SUBJECT_PATH <- "UCI HAR Dataset/train/subject_train.txt"
TRAIN_X_PATH <- "UCI HAR Dataset/train/X_train.txt"
TRAIN_Y_PATH <- "UCI HAR Dataset/train/Y_train.txt"

TEST_SUBJECT_PATH <- "UCI HAR Dataset/test/subject_test.txt"
TEST_X_PATH <- "UCI HAR Dataset/test/X_test.txt"
TEST_Y_PATH <- "UCI HAR Dataset/test/Y_test.txt"

############################################################################
# Environment
setwd(WORKING_DIRECTORY)

############################################################################
# File download & uncompress

if (! SKIP_DOWNLOAD_PROCESS) {
  download.file(url = SOURCE_FILE_URL, destfile = DEST_FILE_PATH, method = "curl")
  unzip(DEST_FILE_PATH)
}

############################################################################
# Load Feature and Activity Labels

# data frames used for both train and test
feature_labels <- read.table(FEATURE_LABELS_PATH)
activity_labels <- read.table(ACTIVITY_LABELS_PATH)

############################################################################
# Load Train Data

# main file
train_X <- read.table(file = TRAIN_X_PATH)
names(train_X) <- feature_labels$V2

# files with the activity
train_Y <- read.table(file = TRAIN_Y_PATH)
names(train_Y) <- c("activity")

# subject
train_subject <- read.table(file = TRAIN_SUBJECT_PATH)
names(train_subject) <- c("subject")

# put all them together
train <- cbind(train_subject, train_X, train_Y)

############################################################################
# Load Test Data

# main file
test_X <- read.table(file = TEST_X_PATH)
names(test_X) <- feature_labels$V2

# files with the activity
test_Y <- read.table(file = TEST_Y_PATH)
names(test_Y) <- c("activity")

# subject
test_subject <- read.table(file = TEST_SUBJECT_PATH)
names(test_subject) <- c("subject")

# put all them together
test <- cbind(test_subject, test_X, test_Y)

############################################################################
# Combine train and test

data <- rbind(train, test)

############################################################################
# Remove unwanted columns

mean_columns <- names(train)[grepl("mean()", names(train))]
std_columns <- names(train)[grepl("std()", names(train))]
wanted_columns <- c ("subject", "activity", mean_columns, std_columns)
data_cleaned <- data[,names(data) %in% wanted_columns]

############################################################################
# Create tidy data set with the averages

# coi => columns of interest
coi_source <- c(mean_columns, std_columns)
coi_target <- sub("$", "-mean()", coi_source)

# I decided to make this computation inside a for loop
# to make it more readable
data_tidy <- data.frame()
for(subject in unique(data_cleaned$subject)) {
  for(activity in unique(data_cleaned[data_cleaned$subject == subject, "activity"])) {

    # new row index
    rowIndex <- nrow(data_tidy) + 1

    # create main values
    data_tidy[rowIndex, "subject"] <- subject
    data_tidy[rowIndex, "activity"] <- activity

    for(colIndex in 1:length(coi_source)) {

      # compute average
      value <- mean(data_cleaned[
        data_cleaned$subject == subject
        & data_cleaned$activity == activity,
        coi_source[colIndex]
        ])

      # set mean value
      data_tidy[rowIndex, coi_target[colIndex]] <- value

    }
  }
}

############################################################################
# Convert activity to factor

data_tidy$activity <- factor(data_tidy$activity, levels = activity_labels$V1,
                          labels=activity_labels$V2)

############################################################################
# Write tidy data file

write.table(data_tidy, file = RESULT_FILE_PATH, row.names=FALSE)
