# CodeBook for 'Getting and Cleaning Data' Course

### Original Data
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <br />
Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones <br />

Total no. of observations: 10299 <br />
Total no. of variables: 561 <br /><br />

### Tidy Data (output of run_analysis.R)
The tidy data contains the following: <br />
* Average of each variable (ie. mean and standard deviation measurements) for each activity and each subject  <br />
* Descriptive activity names <br />
* Descriptive variable names <br />

This produces a refined data set of the following: <br />
Total no. of observations: 180 (excluding 1 row as the header) <br />
Total no. of variables: 88<br /><br />

### What does run_analysis.R do? (The data transformation process and variables are stated here) <br />
The data transformation process is divided into 6 key steps <br />

2. First, the initialisation works to load data into environment 
  * Data from the training and test data sets are first read into temporary data frames.
    * dfTrainFeatures - Temporary Training data frame on Features  
    * dfTrainActivity - Temporary Training data frame on Activity
    * dfTrainSubject - Temporary Training data frame on Subject
    * dfTestFeatures - Temporary Test data frame on Features
    * dfTestActivity - Temporary Test data frame on Activity
    * dfTestSubject - Temporary Test data frame on Subject
  * Supporting meta data are read into data frames. 
    * dfFeatureNames - Measurement names data frame (e.g. TimeBodyAccelerometerMean()-X)
    * dfActivityLabels - Activity labels data frame (e.g. walking, standing and etc.)
  
3. Then, the training and test data sets are merged into one data set 
  * Binds observations from Training and test data sets
    * dfFeatures - Temporary data frame of features 
    * dfActivity - Temporary data frame of activity
    * dfSubject  - Temporary data frame of subject
  * Assign proper namings into data frames
  * Merge the temporary data frames (dfFeature, dfActivity and dfSubject) into a single merged data set
    * dfMergedData - Single merged data with 10,299 observations of 563 variables

3. Next, only the measurements on the mean & std dev. are extracted from merged data set
  * Get column names with mean and std dev.
  * Add back the last 2 columns which stores the activity and subject
  * Extract only mean & standard deviation measurements
    * dfExtractedData - Single merged data with 10,299 observations of 88 variables 
  
4. Then, descriptive activity names are applied to the activities in the data set
  * Change Activity column to type character from numeric 
  * Update activity names from dfActivityLabels meta data
  * Factor the activity columns
    * dfExtractedData$Activity will now contain values such as walking, standing, sitting

5. Appropriate labels are applied to variable names
  * Variable names are updated. e.g. "Acc" to "Accelerometer", "^t" to "Time"
  * This produces results as follows: e.g. TimeBodyAccelerometerMean()-X, TimeBodyAccelerometerSTD()-Y

6. Finally, an independent tidy data set with the average of each variable for each activity and each subject is created
  * Set Subject column as a factor variable
    * dfExtractedData$Subject will now contain values such as 1,2,3
  * Create a tidy data set with average for each activity and subject
  * Order the tidy data set based on subject and activity
    * dfTidyData - Single merged data with 180 observations of 88 variables that is ordered by subject and activity
  * Write the updated data set into "Tidy Data.txt" with row.names set to false 
