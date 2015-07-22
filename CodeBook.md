# CodeBook for 'Getting and Cleaning Data' Course

### Original Data
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Total no. of observations: 10299
Total no. of variables: 561

### Tidy Data (output of run_analysis.R)
The tidy data contains the following:
1. Average of each variable (ie. mean and standard deviation measurements) for each activity and each subject 
2. Descriptive activity names
3. Descriptive variable names

This produces a refined data set of the following:
Total no. of observations: 180 (excluding 1 row as the header)
Total no. of variables: 88


### What does run_analysis.R do? (The data transformation process and variables are stated here)
