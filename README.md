# Getting-and-Cleaning-Data Course
### Description of Repository
This repository stores all relevant files and data for the programming assignment in
"Getting and Cleaning Data" course. 

This course is organised by Johns Hopkins University via the Coursera platform.

This is a submission by Nicholas Lee from Malaysia.


### Purpose of programming assignment
The purpose of this project is to show how data is collected, processed and cleanse into a tidy data format that can be used for later analysis. To demonstrate this, raw data from a case study will be used. The raw data here contains human activity recognition data built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

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
4. 'UCI HAR Dataset' - folder that stores the downloaded data sets
5. Tidy Data. txt  - Results of run_analysis.R which is a tidy data set

### Quick Start Guide
Step 1: Download the file (zip) from the link under the Data Source section.
Step 2: Unzip the file into a working directory of your choice. Ensure that the "UCI HAR Dataset" folder is in the same directory as the run_analysis.R script.
Step 3: Open up R Studio.
Step 4: Run the following commands:
        a. setwd("<Key in your working directory>")
        b. source("run_analysis.R")             ## a "Tidy Data.txt" file will be produced in "UCI HAR Dataset" folder
        c. dtResults <- read.table("Tidy Data.txt")     ## to get data from text file into a data frame
        d. View(dtResults)                              ## To view the results


