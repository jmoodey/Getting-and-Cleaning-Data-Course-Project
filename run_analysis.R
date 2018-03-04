library(tidyr)

# Load Features 
features <- read.table("features.txt", header=FALSE)
activity_labels <- read.table("activity_labels.txt", header=FALSE)

# Load the train data sets
x_train <- read.table("train/X_train.txt",header=FALSE)
y_train <- read.table("train/y_train.txt",header=FALSE)
subject_train <- read.table("train/subject_train.txt",header=FALSE)

# Load the test data sets
x_test <- read.table("test/X_test.txt",header=FALSE)
y_test <- read.table("test/y_test.txt",header=FALSE)
subject_test <- read.table("test/subject_test.txt",header=FALSE)


# Merge train and test data sets
merged_features <- rbind(x_train, x_test)
merged_activity <- rbind(y_train, y_test)
merged_subject <- rbind(subject_train, subject_test)
# Name the columns
names(merged_activity) <- c("Activity")
names(merged_subject) <- c("Subject")
names(merged_features) <- features$V2

# Merge Subject, Activity and Features together
combine_columns <- cbind(merged_subject, merged_activity)
merged_data <- cbind(combine_columns, merged_features)

# Extract Mean and Standard Deviation
stdMeanColumns <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

# Select the required columns 
required_columns <- c("Subject", "Activity", as.character(stdMeanColumns))
required_data <- subset(merged_data, select=required_columns)

# Update Activity Id with the Activity Label    
for (i in 1:6){
    required_data$Activity[required_data$Activity == i] <- as.character(activity_labels[i,2])
}

# Calculate average and sort the data
mean.data<-aggregate(. ~Subject + Activity, required_data, mean)
mean.data<-mean.data[order(mean.data$Subject,mean.data$Activity),]

# Write to tidy_data.txt 
write.table(mean.data, "tidy_data.txt", row.names = FALSE, quote = FALSE)
