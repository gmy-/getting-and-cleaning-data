## Getting and Cleaning Data Course Project Code Book
=====================================================

## Introduction

This code book describes the variables, the data, and the transformations that were performed to clean up the data.


## Data Description

(taken from Human Activity Recognition Using Smartphones Dataset description)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Data Dictionary

activity - one of 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
        
subject - one of 30 volunteers

tBodyAcc-mean()-X - mean body acceleration signal in the X direction

tBodyAcc-mean()-Y - mean body acceleration signal in the Y direction

tBodyAcc-mean()-Z - mean body acceleration signal in the Z direction

tGravityAcc-mean()-X - mean gravity acceleration signal in the X direction

tGravityAcc-mean()-Y - mean gravity acceleration signal in the Y direction

tGravityAcc-mean()-Z - mean gravity acceleration signal in the Z direction

tBodyAccJerk-mean()-X - mean body linear acceleration Jerk signal in the X direction

tBodyAccJerk-mean()-Y - mean body linear acceleration Jerk signal in the Y direction

tBodyAccJerk-mean()-Z - mean body linear acceleration Jerk signal in the Z direction

tBodyGyro-mean()-X - mean body angular velocity signal in the X direction

tBodyGyro-mean()-Y - mean body angular velocity signal in the Y direction

tBodyGyro-mean()-Z - mean body angular velocity signal in the Z direction

tBodyGyroJerk-mean()-X - mean body angular velocity Jerk signal in the X direction

tBodyGyroJerk-mean()-Y - mean body angular velocity Jerk signal in the Y direction

tBodyGyroJerk-mean()-Z - mean body angular velocity Jerk signal in the Z direction

tBodyAccMag-mean() - mean magnitude of body acceleration signal

tGravityAccMag-mean() - mean magnitude of gravity acceleration signal

tBodyAccJerkMag-mean() - mean magnitude of gravity acceleration Jerk signal

tBodyGyroMag-mean() - mean magnitude of angular velocity signal

tBodyGyroJerkMag-mean() - mean magnitude of angular velocity Jerk signal

tBodyAcc-std()-X - standard deviaton of body acceleration signal in the X direction

tBodyAcc-std()-Y - standard deviaton of body acceleration signal in the Y direction

tBodyAcc-std()-Z - standard deviaton of body acceleration signal in the Z direction

tGravityAcc-std()-X - standard deviaton of gravity acceleration signal in the X direction

tGravityAcc-std()-Y - standard deviaton of gravity acceleration signal in the Y direction

tGravityAcc-std()-Z - standard deviaton of gravity acceleration signal in the Z direction

tBodyAccJerk-std()-X - standard deviaton of body linear acceleration Jerk signal in the X direction

tBodyAccJerk-std()-Y - standard deviaton of body linear acceleration Jerk signal in the Y direction

tBodyAccJerk-std()-Z - standard deviaton of body linear acceleration Jerk signal in the Z direction

tBodyGyro-std()-X - standard deviaton of body angular velocity Jerk signal in the X direction

tBodyGyro-std()-Y - standard deviaton of body angular velocity Jerk signal in the Y direction

tBodyGyro-std()-Z - standard deviaton of body angular velocity Jerk signal in the Z direction

tBodyGyroJerk-std()-X - standard deviation of body angular velocity Jerk signal in the X direction

tBodyGyroJerk-std()-Y - standard deviation of body angular velocity Jerk signal in the Y direction

tBodyGyroJerk-std()-Z - standard deviation of body angular velocity Jerk signal in the Z direction

tBodyAccMag-std() - standard deviation of magnitude of body acceleration signal

tGravityAccMag-std() - standard deviation of magnitude of gravity acceleration signal

tBodyAccJerkMag-std() - standard deviation of magnitude of gravity acceleration Jerk signal

tBodyGyroMag-std() - standard deviation of magnitude of angular velocity signal

tBodyGyroJerkMag-std() - standard deviation of magnitude of angular velocity Jerk signal

The variables starting with 'f' (those that indicate frequency domain signal) were removed from the description above in order to avoid duplication.


## Data Transformations

(this information is mostly duplicated in README.md - it is included here since the code book should describe data transformations; in addition, the description here is more detailed)

1. Read training and test sets (from "train/X_train.txt" and "test/X_test.txt")
2. Read activity labels and the correspondence between the class labels and the activity names (from "train/y_train.txt" and "test/y_test.txt").
3. Read the names of the variables of the feature vector (from "features.txt", where the list of all feature is provided in the original data set).
4. Read the information about the subject who performed the activity for training and test sets (from "train/subject_train.txt" and "test/subject_test.txt").
5. Mark all observations as training/test set so that it is possible to distinguish the source of data later - this is done by introducing an extra column with "train" or "test" value, which becomes the first column.
6. Add the information about subject and activity - this is achieved by simply adding columns from the previous step. Subject is added as the 2nd column and activity as the 3rd column (by using cbind).
7. Merge training and test sets to create one data set (step 1 of the assignment descriptions) - this merged is done by rbind, so that the rows are simply combined.
8. Label the data set with descriptive variable names by using names of the variables of the feature vector - this is called step 4 in the assignment description; yet, it is done right after step 1 so that in the next step it would be possible to select columns based on their names. This labeling is done by setting the first 3 columns to "set", "subject", and "activity" (according to the previous steps 5-7) and by taking values from the features data frame that was read in step 3.
9. Select only the measurements on the mean and standard deviation for each measurement (step 2 of the assignment descriptions) - this is achieved by searching for the text "mean()" and "std()" by using regular expressions.
10. Replace activity class labels with descriptive activity names - use descriptive activity names to name the activities in the data set (step 3 of the assignment descriptions).
11. Group data by activity and subject.
12. Create independent tidy data set with the average of each variable for each activity and each subject. During the process of summarizing the data the information about the set is lost - this behavior is considered acceptable since the assignment does not mention that the set should be taken into account, so it is ignored (step 5 of the assignment descriptions).
13. Write the tidy data set created in the previous step to the output file.