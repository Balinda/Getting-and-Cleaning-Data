# Code Book


## Original Data Sets
**Original data sets can be found here:**  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


**Data set information can be found here:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Process used to transform/tidy the data

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

Variable Name       | Description             | Values
--------------------|-------------------------|-------
`Subject`           | ID of Subject           | Integer (1-30)
`Activity`          | Activity Name           | Factor (6 levels)
`activityNumber`    | ID of Activity          | Integer (1-6)

The remaining 66 columns represent average measurements by Subject and Activity using the following abbreviation codes.
The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.


## Abbreviations

Abbreviation        | Description
--------------------|------------
`Acc`               | Data obtained from Accelerometer
`Gyro`              | Data obtained from Gyroscope
`Gravity`           | Measurement based on Gravity. If missing, measurement is a Body measurement.
`FFT`               | Fast Fourier Transform was done on the data
`Jerk`              | Determined as being a Jerk Signal
`Mag`               | Magnitude of signal


## Output

`tidy.csv` is a 180x69 data frame.


## Description of the DATA
  * The features selected for this database come from the accelerometer and gyroscope using 3-axial raw signals (X, Y, and Z). 
  * These time domain signals were captured at a constant rate of 50 Hz. 
  * Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
  * The acceleration signal was then separated into body and gravity acceleration signals (gravity signal denoted by `Gravity` in field name) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
  * The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (denoted by `Jerk` in field name). 
  * The magnitude of these three-dimensional signals were calculated using the Euclidean norm (denoted by `Mag` in field name). 
  * A Fast Fourier Transform (FFT) was applied to some of these signals (denoted by `FFT` in field name). 

The original set of variables that were estimated from these signals are: 
   * mean(): Mean value
   * std(): Standard deviation

These values were further summarized by averaging the data by the combination of Subject and Activity.

`NOTE: averaging standard deviation values does not render useful data. It should be converted to variance before averaging and then converted back to StdDev.`
