## Getting and Cleaning Data Course Project
===========================================

## Introduction

This repository contains the course project for the "Getting and Cleaning Data" course at Coursera.


## Data

The original raw data can be downloaded from the following web site:

* Dataset: [Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## External Dependencies

The code relies on 'dplyr' package in order to simplify operations with data frames.


## Execution

In order to work correctly the code requires the original data set to be placed in the "UCI HAR Dataset" directory. To achieve this you should extract the original archive "getdata-projectfiles-UCI HAR Dataset.zip" to the current working directory.

The tidy data set, which is created in the step 5 of the assignment instructions, is stored in step5dataset.txt in the current working directory.


## Logic Behind The Code

The code is well-documented, so that it is easily possible to read the comments in the code to understand the logic. However, here is the summary of the actions taken that are taken by the code:

1. Read training and test sets.
2. Read activity labels and the correspondence between the class labels and the activity names.
3. Read the names of the variables of the feature vector.
4. Read the information about the subject who performed the activity for training and test sets.
5. Mark all observations as training/test set so that it is possible to distinguish the source of data later.
6. Add the information about subject and activity.
7. Merge training and test sets to create one data set (step 1 of the assignment descriptions).
8. Label the data set with descriptive variable names by using names of the variables of the feature vector - this is called step 4 in the assignment description; yet, it is done right after step 1 so that in the next step it would be possible to select columns based on their names.
9. Select only the measurements on the mean and standard deviation for each measurement (step 2 of the assignment descriptions).
10. Replace activity class labels with descriptive activity names - use descriptive activity names to name the activities in the data set (step 3 of the assignment descriptions).
11. Group data by activity and subject.
12. Create independent tidy data set with the average of each variable for each activity and each subject. During the process of summarizing the data the information about the set is lost - this behavior is considered acceptable since the assignment does not mention that the set should be taken into account, so it is ignored (step 5 of the assignment descriptions).
13. Write the tidy data set created in the previous step to the output file.