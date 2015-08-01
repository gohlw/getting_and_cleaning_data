#Codebook

First of all, thank you for your time for peer reviewing this project.
This data is create as project for Coursera's Data Science course.

## Getting and Cleaning Data Course Project
Instructions for project The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data Dictionary
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. and the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) – both using a low pass Butterworth filter.

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).


leading "time" or "frequency" indicates the data is based on time or frequency measurements.
Body = related to body movement.
Gravity = acceleration of gravity
Accelerometer = accelerometer measurement
Gyroscope = gyroscopic measurements
Jerk = sudden movement acceleration
Magnitude = magnitude of movement
mean and SD are calculated for each subject for each activity for each mean and SD measurements.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.


The set of variables that were estimated from these signals are:

MEAN(): Mean value
SD(): Standard deviation

## How the data been processed
1.) https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip is download, unzip\n
2.) The data in "test" and "train" will be read into R, unaltered, all the processing of data is done on R\n
3.) /UCI HAR Dataset/train/X_train.txt is combine (rbind) with /UCI HAR Dataset/test/X_test.txt to form the "set" dataset (most of the measurement is in here)
4.) /UCI HAR Dataset/train/y_train.txt is combine (rbind) with /UCI HAR Dataset/test/y_test.txt to form the "activity" dataset
5.) /UCI HAR Dataset/train/subject_train.txt is combine (rbind) with /UCI HAR Dataset/test/subject_test.txt to form the "subject" dataset
6.) /UCI HAR Dataset/features.txt is read to obtain all the table header for "set" (step 3 above)
7.) Table headers is assigned to "set"(using data from set 6), "activity" (hard coded to "activity"), and "subject" (hard coded to "subject")
8.) "set" dataset is subset to taking out those column with header that contains "std" and "mean" only
9.) all three dataset : "subject", "activity", and the filtered "set" is column binded (cbind)
10.) Apply appropriate, easy to read name to the combined data (see data dictionary section for more details)
11.) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
12.) The data set on step 11 is output to a text file name "average.txt"

