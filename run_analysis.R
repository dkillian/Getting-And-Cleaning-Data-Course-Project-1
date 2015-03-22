# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# =================================================================================================================================================

####################################################################################################################

# Assumed downloaded and extracted data files as below:
# setwd("/Users/Sarah/Documents/datasciencecourse")
# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(url, destfile = "./Dataset.zip", method = "curl")
# unzip("./Dataset.zip", exdir = ".")

####################################################################################################################

library(dplyr)

## 1. Merge the training and the test sets to create one data set.

# read files
fileHome <- file.path(".", "UCI HAR Dataset")
x_train <- read.table(file.path(fileHome, "train/X_train.txt"))
x_test <- read.table(file.path(fileHome, "test/X_test.txt"))
y_train <- read.table(file.path(fileHome, "train/y_train.txt"))
y_test <- read.table(file.path(fileHome, "test/y_test.txt"))
subject_train <- read.table(file.path(fileHome, "train/subject_train.txt"))
subject_test <- read.table(file.path(fileHome, "test/subject_test.txt"))

# combine train and test data 
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# combine data to one set in order (subject, activity, features data)
totaldata <- cbind(subject_data, y_data, x_data)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# read features and name columns
features <- read.table(file.path(fileHome, "features.txt"))
names(totaldata) <- c("subject", "activity", as.character(features$V2))

# extract only mean and std feature columns
extractCols <- grep(".*mean().*|.*std()*", names(totaldata))
valid_column_names <- make.names(names=names(totaldata), unique=TRUE, allow_ = TRUE)

# select desired rows of full dataset using dplyr
finaldata <- select(totaldata, subject, activity, extractCols)


## 3. Uses descriptive activity names to name the activities in the data set

# read descriptive activity labels
activities <- read.table(file.path(fileHome, "activity_labels.txt"))

# feed in activity labels to finaldata set using dplyr
finaldata <- mutate(finaldata, activity = factor(activity, levels = c(1:6), labels = activities$V2))


## 4. Appropriately labels the data set with descriptive variable names. 
# Note: Basic labelling step completed in step 2 for simplicity. 


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# group by activity, subject. find mean by group using dplyr
grouped_data <- group_by(finaldata, activity, subject)
summary <- grouped_data %>% summarise_each(funs(mean))

# write tidy table to txt file
write.table(summary, file = "tidy.txt", row.names = FALSE)



