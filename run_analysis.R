## Create one R script called run_analysis.R that does the following:

if (!require("plyr")) {
  install.packages("plyr")
}

require("plyr")

## 1. Merges the training and the test sets to create one data set.
# Get data from activity_labels.txt
acti_label <- read.table("UCI HAR Dataset/activity_labels.txt", header=F, stringsAsFactors=F)
names(acti_label) <- c("act_num", "act_label")
acti_label

# Get data from features.txt
column_name <- read.table("UCI HAR Dataset/features.txt", header=F, stringsAsFactors=F)
column_name <- column_name[,-1]
head(column_name)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
measure_n <- grep("mean|std", column_name)
column_name[measure_n]

## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=F, stringsAsFactors=F)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=F, stringsAsFactors=F)
subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F, stringsAsFactors=F)
names(subj_test) <- "subject_test"
y_test[,2] <- acti_label[y_test[,1],2]
names(x_test) <- column_name
x_test_ex <- x_test[,measure_n]
names(y_test) <- c("acti_ID_y", "acti_label_y")
head(x_test_ex)

test_table <- cbind(as.data.frame(subj_test), y_test, x_test_ex)

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=F, stringsAsFactors=F)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=F, stringsAsFactors=F)
subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F, stringsAsFactors=F)
names(subj_train) <- "subject_train"
y_train[,2] <- acti_label[y_train[,1],2]
names(x_train) <- column_name
x_train_ex <- x_train[,measure_n]
names(y_train) <- c("acti_ID_y", "acti_label_y")
head(x_train_ex)

train_table <- cbind(as.data.frame(subj_train), y_train, x_train_ex)

names(test_table)[1] <- "subject"
names(train_table)[1] <- "subject"

complete_table <- rbind(train_table, test_table)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average_tidy <- ddply(complete_table, .(subject, acti_ID_y), function(x) colMeans(x[, 4:82]))
write.table(average_tidy, "tidy_data.txt", row.name=FALSE)
