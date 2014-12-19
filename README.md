#Purpose of this document#

This code is part of course project for Data Science Specialization (Getting and cleaning data)
This document describes the code in "run_analysis.R" and how to execute the code

##How to execute the code ##

Inorder to execute this code you need to have "UCI HAR Dataset" inside your working directory
Go to R command prompt source the file "run_analysis.R" and then type "run_analysis()". 
It create a text file called "tidy_data.txt" in the working directory which contains 
average of each variable for each activity and each subject

##Files needed##

Following are files needed to execute the code.

- UCI HAR Dataset/activity_labels.txt : Links the class labels with their activity name.
- UCI HAR Dataset/features.txt : various features (561 in total)
- UCI HAR Dataset/'features_info.txt': Shows information about the variables used on the feature vector.
- UCI HAR Dataset/test/subject_test.txt : 
- UCI HAR Dataset/test/X_test.txt : Test set
- UCI HAR Dataset/test/y_test.txt : Test labels
- UCI HAR Dataset/train/subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- UCI HAR Dataset/train/X_trian.txt : training set
- UCI HAR Dataset/train/y_trian.txt : Training Label


##libraries needed##
Code makes extensive use of dplyr package to create , filter, sort, summarize and arrange data tables


##Various Files in this directory##

1. Readme.md : this file
2. run_analysis.R : R code which does all task decribed below.
3. tidy_data.txt : file containing tidy data created in step 5 below
4. CodeBook.md : Explaination of the variables in tidy_data.txt  



##What does the code do##


1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
