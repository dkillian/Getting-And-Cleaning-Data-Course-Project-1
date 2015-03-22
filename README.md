# Getting And Cleaning Data: Course Project
## Introduction
This repository contains the required files for this project.
The objective of the run_analysis.R script is to download and tidy the datasets provided by UCI on the activity data collected from the accelerometers from the Samsung Galaxy S smartphone worn by 30 volunteers. The tidy dataset can then be used for further analysis

## Requirements
1. The run_analysis.R code is written assuming the UCI HAR Dataset is downloaded and data files are extracted as "UCI HAR Dataset" into the working directory as below:
setwd("/Users/Sarah/Documents/datasciencecourse")
download.file(url, destfile = "./Dataset.zip", method = "curl")
unzip("./Dataset.zip", exdir = ".")

2. The run_analysis.R code employed the use of the following packages that need to be installed:
  *dplyr package 

## Linking of datasets
The following files within the UCI HAR Dataset are used, and are related in the following ways:
* Data: X_test.txt, X_train.txt files are combined row wise to form the main body of data showing the readings of each feature
* Activities: Y_test.txt, Y_train.txt files are combined row wise to form the respective numerical labels of the 6 activities 
* Activity Descriptions: activity_labels.txt link a descriptive activity to each numerical identifier in the combined y_data (1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING) 
* Subjects: subject_test.txt, subject_train.txt are combined row wise to form the identifying number of each of the 30 volunteers
* Features: features.txt is used to identify the descriptive labels of what Data is measuring (there are 561 different measurements in the original data)

Refer to CodeBook.md for detailed explanation of variables



