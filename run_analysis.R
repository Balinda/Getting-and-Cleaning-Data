# set up directory and load necessary libraries
setwd("C:/Coursera/Data Science/Course 3 - Getting and Cleaning Data/Week 4 - Text and Date Manipulation")
#
if (!"plyr" %in% installed.packages()) install.packages("plyr")	#install plyr package if necessary
if (!"dplyr" %in% installed.packages()) install.packages("dplyr")	#install dplyr package if necessary
#
library(plyr)
library(dplyr)
#
# 1. Read in training and test data and combine them
#
train <- read.table("X_train.txt", header=FALSE)
test <- read.table("X_test.txt", header=FALSE)
train_activity <- read.table("y_train.txt", col.names=c("ActivityNumber"), header=FALSE) #Activity numbers for train data
test_activity <- read.table("y_test.txt", col.names=c("ActivityNumber"), header=FALSE)   #Activity numbers for test data
train_subject <- read.table("subject_train.txt", col.names=c("Subject"), header=FALSE) # subject number aligned with that row of data
test_subject <- read.table("subject_test.txt", col.names=c("Subject"), header=FALSE)   # subject number aligned with that row of data
#
#combine all data rows
all_data <- rbind(train, test)
#
# add column names to the data so we can subset on column names later
features <- read.table("features.txt", header=FALSE)
names(all_data) <- features[,2]  
#
# 2. Use only the data/columns for mean and standard deviation
#
# have to use \\ to indicate special characters
mean_std_cols <- grep("mean\\(\\)|std\\(\\)",names(all_data), value=TRUE)
mean_std_data <- all_data[ , which(names(all_data) %in% mean_std_cols)]
#
# Add subject and activity number columns
mean_std_data <- cbind(mean_std_data, rbind(train_subject, test_subject), rbind(train_activity, test_activity))
#
# 3. Convert activity labels to something more meaningful (actual activities)
#
activity <- read.table("activity_labels.txt", col.names=c("ActivityNumber", "Activity"),header=FALSE)  # Actual Activity names
mean_std_data <- merge(mean_std_data, activity, by="ActivityNumber", all.x=TRUE)
##
# 4. Clean up variable names (based on slightly modified version of SQL column standards)
#
# Use PascalCase (Note: lecture indicated all lower case, but I prefer PascalCase)
names(mean_std_data) <- gsub("mean", "Mean",names(mean_std_data))
#
# no special characters (remove dashes and parens)
names(mean_std_data) <- gsub("[-()]","",names(mean_std_data))
#
# no abbreviations (I am modifying this requirement as using full names would make the variables extremely
# long and certain abbreviations have become standard knowledge (such as StdDev for Standard Deviation)
# 
# beginning "t" not needed, beginning "f" = FFT, "Body" not needed, change std to StdDev
names(mean_std_data) <- gsub("^t","",names(mean_std_data))			# remove beginning t
names(mean_std_data) <- gsub("^f", "FFT",names(mean_std_data))		# change beginning f to FFT
names(mean_std_data) <- gsub("Body", "",names(mean_std_data))		# remove all references to Body
names(mean_std_data) <- gsub("std", "StdDev",names(mean_std_data))	# change std to StdDev
#
# 5. Average each variable by activity and subject.
#
group_data <- group_by(mean_std_data, Subject, Activity)			#group by subject & activity
group_data_means <- summarize_each(group_data, funs(mean)) 	#capture mean of grouped data
#
# save tidy data with summarized means
write.csv(group_data_means, "tidy.csv")

