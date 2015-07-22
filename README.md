# Getting-and-Cleaning-Data Course
### Description of Repository
This repository stores all relevant files and data for the programming assignment in
"Getting and Cleaning Data" course organised by Johns Hopkins University via the Coursera platform.

This is a submission by Nicholas Lee from Malaysia.


### Purpose of programming assignment
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set from a case studythat collects data from the accelerometers of Samsung Galaxy S smartphone. The goal is to prepare tidy data that can be used for later analysis.

More specifically, the project requires us to develop an R script that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Data Source
The link to the original data source is available here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

An accompanying description about the data source is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Files
1. run_analysis.R
2. README.md
3. CodeBook.md
4. 'UCI HAR Dataset' folder that stores the downloaded data sets and the tidy data set - "Tidy Data.txt".

### Quick Start Guide
Step 1: Download the file (zip) from the link above in the Data Source section.
Step 2: Unzip the file into a working directory of your choice. Ensure that the "UCI HAR Dataset" folder is in the same directory as the run_analysis.R script.
Step 3: Open up R Studio
Step 4: Run the following commands:
        a. setwd("<Your working directory>")
        b. source("run_analysis.R")  ## a "Tidy Data.txt" file will be produced
Step 5: Run View("./UCI HAR Dataset/Tidy Data.txt")  ## A data set of a list of averages will be displayed 


