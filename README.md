# README.md

This repository contains all scripts, data, and required files for reproducing my Week 4 final project of the Getting and Cleaning Data Coursera course.

## Original Data Sets
**Original data sets can be found here:**  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Files used:**	
1. X_train.txt - Data from accelerometer and gyroscope for training data
2. X_test.txt - Data from accelerometer and gyroscope for test data
3. y_train.txt - Activity number the data is associated with for training data
4. y_test.txt - Activity number the data is associated with for test data
5. subject_train.txt - Number of the subject that carried out the experiment for training data
6. subject_test.txt - Number of the subject that carried out the experiment for test data
7. features.txt - Column names for the data
8. activity_labels.txt - Types of activities conducted

## Scripts
1. run_analysis.R - Code to read and clean data as specified by assignment

## Output
1. tidy.csv	- tidy data set that meets requirements below

## How to reproduce results
1.	Copy files listed under *Files used* to your default directory
2.	Copy script(s) to your default directory
3.	Source run_analysis.R
4.	Change directory in setwd command (line 2) to your default directory
5.	Run the updated run_analysis.R script

# Assignment
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



