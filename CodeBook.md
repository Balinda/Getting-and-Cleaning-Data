# Code Book


## Original Data Sets
**Original data sets can be found here:**  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


**Data set information can be found here:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Process used to transform/tidy data

The `run_analysis.R` script contains the following logic:


1. Merge the training and test sets to create one data set.

   * Combines X_, y_, and Subject_ text files for both train and test
   * Uses features data for column names

2. Subsets data to only use measurements of mean and standard
   deviation.

   * greps "mean()" and "std()" so as not to include meanFreq
   * binds Subject number and Activity number columns to data set

3. Converts Activity numbers to actual Activity names using `activity_labels.txt`.
   * uses PascalCase
   * removes dashes and parentheses
   * removes beginning 't' character
   * converts beginning 'f' character to FFT
   * removes the word 'Body' as it is not needed (see Variables section)
   * converts 'std' to more descriptive and conforming 'StdDev'


5. Averages each variable by Subject and Activity.

6. Resulting data is saved as `tidy.csv`.

## Variables

Variable name       | Description
--------------------|------------
`subject`           | ID of subject, int (1-30)
`activity_num`      | ID of activity, int (1-6)
`activity_name`     | Label of activity, Factor w/ 6 levels
