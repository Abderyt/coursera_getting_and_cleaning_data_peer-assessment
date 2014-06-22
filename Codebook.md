getting and cleaning data, course project, codebook
===================================================
This file is codebook, describing the data/variables and transformations done in run_analysis.R .
* Source of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The run_analysis.R script does the following steps to get cleaned data:
 1. Read files: X_train.txt, y_train.txt and subject_train.txt from "uci_har_dataset/train" folder and store.
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "uci_har_dataset/test" folder and store.
 3. Concatenate and to generate data frames.
 4. Read the features.txt file from the "/uci_har_dataset" folder, store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list.
 5. Read the activity_labels.txt file from the "./uci_har_dataset"" folder and store the data in a variable called *activity*.  
 6. Clean the activity names in the second column of *activity*.
 7. Transform the values of the dataset according to the *activity* data frame.  
 8. Combine the X_data, Y_data, Z_data by column to get data frame, *cleaned*. Name the first two columns to "subject" and "activity". 
 9. Write the *cleaned* out to "merged_clean_data.txt" file in "cleaned_data" directory.  
 10. Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the *res* data frame and performing the two for-loops, we get a 180x68 data frame.
 11. Write the *res* out to "dataset_w_averages.txt" file in current working directory.