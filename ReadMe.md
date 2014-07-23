#Summary of Human Activity Recognition Using Smartphones Dataset
#Version 1.0
>J. Delh for Coursera - Getting and Cleaning Data Course Project

##The dataset includes the following files:
- ReadMe.md
- tidyData.txt : contains summary data collected by the accelerometers from the Samsung Galaxy S Smartphone during the Human Activity Recognition experiment
- codebook.md : shows information about the variables used in the tidy data set.
- run_analysis.R : R script that uses Samsung data as an input and outputs tidyData.txt

##The run_analysis.R script does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##How to use the run_analysis.R script:
- the script must be in the same folder as Samsung data 
- run run_analysis.R
- get the output (tidyData.txt). This data can be read into R with the command:
 
>read.table("tidyData.txt", header=TRUE)

##How the tidy data set is built:
- The columns for mean and standard deviation are extracted and merged from training and test source datasets. 

>In the source datasets, the mean and standard deviation measurements correspond to features that ends with __--mean()__ and __--std()__.

- For better readability, the columns are renamed using the following convention: 

> - Each part of the measurement label begins with an uppercase and are separated by a '.' (_dot_).
> - measurement label starts with _Time._ for features that correspond to time domain signals (features that begins with a t)
> - measurement label starts with _Freq._ for features that correspond to frequency domain signals (features that begins with a t)

- The values average of each variable for each activity and each subject
