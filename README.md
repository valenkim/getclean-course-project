# Getting and Cleaning Data

## Course Project

I create ```run_analysis.R``` that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to get tidy set and work on project

1. Download the data source. (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Put into a folder on local drive. I will get a ```UCI HAR Dataset``` folder.
3. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it using ```setwd()``` function.
4. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in my working directory.

## More : Dependencies

```run_analysis.R``` file will install the dependencies automatically. It depends on ```reshape2``` and ```data.table``` packages. 
