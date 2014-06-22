# run_analysis.R 
## scripts for getting and cleaning data, peer assignment
## etele @ github
## 2014-06-22

# source data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

setwd('uci_har_dataset')

# run_analysis.R description
# 1.  read and merge training and test data to create one dataset
# 2.  extract the measurements on stdev and mean for each observation


# 1. read and merge

x_train <- read.table("train/X_train.txt")
x_test  <- read.table("test/X_test.txt")
X_data  <- rbind(x_train, x_test)

s_train <- read.table("train/subject_train.txt")
s_test  <- read.table("test/subject_test.txt")
S_data  <- rbind(s_train, s_test)

y_train <- read.table("train/y_train.txt")
y_test  <- read.table("test/y_test.txt")
Y_data  <- rbind(y_train, y_test)

# 2. extract data
features <- read.table("features.txt")
good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_data <- X_data[, good_features]

names(X_data) <- features[good_features, 2]
names(X_data) <- gsub("\\(|\\)", "", names(X_data))
names(X_data) <- tolower(names(X_data))

# 3. name the activities in the data set
actv <- read.table("activity_labels.txt")
actv[, 2] = gsub("_", "", tolower(as.character(actv[, 2])))
Y_data[,1] = actv[Y_data[,1], 2]
names(Y_data) <- "activity"

# 4. labels the data set with descrptive names
names(S_data) <- "subject"
cleaned <- cbind(S_data, Y_data, X_data)
write.table(cleaned, "../clean_data/merged_clean_data.txt")

# 5. create an other tidy data set with the avg of each variable for each activity/subject

# unique subjects
unique_subj   <- unique(S_data)[,1]

# nr of subjests and activities
numSubjects   <- length(unique(S_data)[,1])
numActivities <- length(actv[,1])
numCols       <- dim(cleaned)[2]
res           <- cleaned[1:(numSubjects*numActivities), ]

row <- 1

# loop over subjects and activities 
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    res[row, 1]   <- unique_subj[s]
    res[row, 2]   <- actv[a, 2]
    tmp           <- cleaned[ cleaned$subject==s & cleaned$activity==actv[a, 2], ]
    res[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row <- row+1
  }
}

# write the clean dataset
write.table(res, "../clean_data/dataset_w_averages.txt")