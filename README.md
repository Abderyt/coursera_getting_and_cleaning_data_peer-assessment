getting and cleaning data course project
========================================
This file describes how run_analysis.R script works.
* Download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "uci_har_dataset" in your work directory.
* Make sure the folder "uci_har_dataset" and the run_analysis.R script are both in the your working directory.
* Create a directory named "clean_data" in your work directory.
* Second, use source("run_analysis.R") command in R/RStudio. 
* Third, you will find two output files are generated in the "clean_data" working directory:
  - merged_clean_data.txt: contains a data frame called cleanedData.
  - dataset_w_averages.txt it contains a data frame called result with 180*68 dimension.
* Finally, use data <- read.table("dataset_w_averages.txt") command in R/RStudio to read the file. We are required to get the avearage of each variable for each activity and each subject, there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.