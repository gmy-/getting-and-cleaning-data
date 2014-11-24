library(dplyr)

## enter dataset directory to avoid repeating directory name
setwd("./UCI HAR Dataset")

## read training and test sets
trainingSet <- tbl_df(read.table("train/X_train.txt"))
testSet <- tbl_df(read.table("test/X_test.txt"))

## read activity labels for training and test sets
trainingLabels <- tbl_df(read.table("train/y_train.txt"))
testLabels <- tbl_df(read.table("test/y_test.txt"))

## read correspondence between class labels and activity names
activityLabels <- read.table("activity_labels.txt")

## read names of the variables of the feature vector
features <- read.table("features.txt", colClasses = c("integer", "character"))

## read information about the subject who performed the activity for training and test sets
trainingSubject <- read.table("train/subject_train.txt", colClasses = "factor")
testSubject <- read.table("test/subject_test.txt", colClasses = "factor")

## restore working directory
setwd("..")

## mark all observations as training set and add information about subject and activity to the training set
training <- tbl_df(cbind(set = rep("train", dim(trainingSet)[1]),
                         subject = trainingSubject[, 1],
                         activity = trainingLabels[, 1],
                         trainingSet))

## mark all observations as test set and add information about subject and activity to the test set
test <- tbl_df(cbind(set = rep("test", dim(testSet)[1]),
                     subject = testSubject[, 1],
                     activity = testLabels[, 1],
                     testSet))

## merge training and test sets to create one data set (step 1)
merged <- rbind(training, test)

## label the data set with descriptive variable names
## by using names of the variables of the feature vector (step 4)
## NOTE: this step is done right after step 1 so that in the next step it would be possible
## to select columns based on their names
names(merged) <- c("set", "subject", "activity", features[, 2])

## select only the measurements on the mean and standard deviation for each measurement (step 2)
selected <- select(merged, set, subject, activity, contains("mean\\(\\)"), contains("std\\(\\)"))

## replace activity class labels with descriptive activity names (step 3)
selected <- mutate(selected, activity = activityLabels[activity, 2])

## group selected data by activity and subject
byActivityAndSubject <- group_by(selected, activity, subject)

## create independent tidy data set with the average of each variable for each activity and each subject
## NOTE: during the process of summarizing the data the information about the set ('set' variable) is lost -
## this behavior is considered acceptable since the assignment does not mention that the set should be taken
## into account, so it is ignored at this step (step 5)
summarized <- summarise_each(byActivityAndSubject, funs(mean), -c(1:3))

## write the tidy data set created in step 5 of the assignment instructions
write.table(summarized, file = "step5dataset.txt", row.names = FALSE)




