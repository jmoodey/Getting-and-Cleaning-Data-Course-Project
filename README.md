# Getting-and-Cleaning-Data-Course-Project
This is the course project for Getting and Cleaning Data. The dataset required for this project is downloaded, unzipped and placed in a working directory. 

The run_analysis.R script does the following:
1. Loads the features and activity labels from the features.txt and activity_labels.txt files respectively. 
2. Loads the x_train, y_train and subject_train information into individual data frames
3. Loads the x_test, y_test and subject_test information into individual data frames
4. Merges train and test data frames into a variable called merged_data
5. Selects the Mean and Standard Deviation measurements from the list of all features
6. Selects all the required fields. 
7. Calculates the average of each variable grouped by Subject and Activity.
8. Exports the data set into the tidy_data.txt file. 
