# Code Book


## Original Data Sets
**Original data sets can be found here:**  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


**Data set information can be found here:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Process used to transform/tidy data

The `run_analysis.R` script contains the following logic:


1. Merge the training and test sets to create one data set.

* Combines X_, y_, and Subject
* Uses features data for column names

2. Subsets data to only use measurements of mean and standard
   deviation.

* greps "mean()" and "std()" so as not to include meanFreq 

3. Reads `activity_labels.txt` and applies human readable activity names to
   name the activities in the data set.

4. Labels 
