library(tidyr)

# Load Features and load the second column into column_names 
features <- read.table("features.txt")
column_names <- as.vector(features[,2])

# Load the train data sets
x_train <- read.table("train/X_train.txt",col.names=column_names)
y_train <- read.table("train/y_train.txt",col.names=c("Activity"))
subject_train <- read.table("train/subject_train.txt",col.names=c("Subject"))

# Combine all train data sets into one
train <- cbind(subject_train, y_train, x_train)

# Load the test data sets
x_test <- read.table("test/X_test.txt",col.names=column_names)
y_test <- read.table("test/y_test.txt",col.names=c("Activity"))
subject_test <- read.table("test/subject_test.txt",col.names=c("Subject"))

# Combine all test data sets into one
test <- cbind(subject_test, y_test, x_test)

# Merge train and test data sets
merged_training_tests <- rbind(train, test)


#mean_std_data <- merged_training_tests[,c(1:2,column_names)]
mean_std_columns <- merged_training_tests[,c(1:2,grep("mean()",colnames(merged_training_tests)),grep("std()",colnames(merged_training_tests)))]

# Assign activity descriptions
activity <- read.table("activity_labels.txt")
merged_training_tests$Activity <- factor(merged_training_tests$Activity,levels= activity[,1], labels= activity[,2]) 
merged_training_tests$Subject <- as.factor(merged_training_tests$Subject)

# Rename columns with better description. 
Better_Col_Names <- sub("^f","Frequency",sub("^t","Time",colnames(merged_training_tests)))
colnames(merged_training_tests) <- Better_Col_Names

# Calculate average
Mean.Data <- aggregate(merged_training_tests[,3:563],list(merged_training_tests$Subject,merged_training_tests$Activity), mean)
colnames(Mean.Data)[colnames(Mean.Data)=="Group.1"] <- "Subject"
colnames(Mean.Data)[colnames(Mean.Data)=="Group.2"] <- "Activity"

# Write to tidy_data.txt 
write.table(Mean.Data, "tidy_data.txt", row.names = FALSE, quote = FALSE)
