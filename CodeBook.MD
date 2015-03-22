# Codebook

## Original data
The original dataset (zip) can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Repurposed Data
The following data sets were used to arrive at a final combined single dataset.
### *Combining data*
| Combined  | Test          | Train  |
| ------------- |:-------------:| -----:|
| x_data      | x_test | x_train |
| y_data     | y_test      |   y_train |
| subject_data | subject_test    |    subject_train |

### *Single dataset*
| Final  | Col1= activity | Col2 = subject | Col 3:563 = list of 561 features |
| ------------- |:-------------:| -----:|-----:|
| finaldata      | subject_data | y_data |x_data  |

## Final dataset
For the purposes of this analysis, the single dataset (finaldata) was cleaned up to include features on the mean and standard deviation for each of the following measurements:  

  * tBodyAcc-XYZ  
  * tGravityAcc-XYZ  
  * tBodyAccJerk-XYZ  
  * tBodyGyro-XYZ  
  * tBodyGyroJerk-XYZ  
  * tBodyAccMag  
  * tGravityAccMag  
  * tBodyAccJerkMag  
  * tBodyGyroMag  
  * tBodyGyroJerkMag  
  * fBodyAcc-XYZ  
  * fBodyAccJerk-XYZ  
  * fBodyGyro-XYZ  
  * fBodyAccMag  
  * fBodyAccJerkMag  
  * fBodyGyroMag  
  * fBodyGyroJerkMag  
   
The mean and standard deviation criteria was taken to include the above measurements that had the following appended:
  * Features with -mean() and -std()
  * Features with -meanFreq(): this was included as this measurement is a weighted average of the frequency components to obtain a mean frequency; hence is assessed to be relevant to the analysis of means.

__Total number of features selected was 79. __
__Total columns for the finaldata was 81, including "activity" and "subject" columns.__


