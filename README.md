# Getting-and-Cleaning-Data-Course-Project
This is the course project for Getting and Cleaning Data. The dataset required for this project is donwloaded, unzipped and placed in a working directory. 

The run_analysis.R script does the following:
1. Loads the features from the features.txt and loads the column names(second column of features) into a data frame called column_names.
2. Loads the x_train, y_train and subject_train information into individual data frames, and then combines the columns and rows into one dataframe called train.
3. Loads the x_test, y_test and subject_test information into individual data frames, and then combines the columns and rows into one dataframe called test.
4. Merges train and test data frame called merged_training_tests
5. Extracts only the measurements on the mean and standard deviation for each measurement.
6. Renames column names that contain "BodyBody" to have only one "Body" to make the column name more descriptive. 
7. Calculates the average of each variable for each Grouped by Subject and Activity
8. Converts the activity and subject columns into factors
9. Creates a tidy dataset that consists of the average (mean) value of each variable grouped by subject and activity pair.
10. The end result is shown in the tidy_data.txt file. 
