## Project: Getting and Cleaning Data Course Project, Programming Assignment


## 1. Initialisation #####################################################################
##########################################################################################
# Read training data into temporary data frame
dfTrainFeatures <- read.table("./UCI HAR Dataset/train/X_train.txt")
dfTrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
dfTrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read test data into temporary data frame
dfTestFeatures <- read.table("./UCI HAR Dataset/test/X_test.txt")
dfTestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
dfTestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")


# Read Supporting Metadata
dfFeatureNames <- read.table("./UCI HAR Dataset/features.txt")
dfActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)


## 2. Merges the training and the test sets to create one data set #######################
##########################################################################################
# Binds observations from Training and test data sets
dfFeatures <- rbind(dfTrainFeatures, dfTestFeatures)
dfActivity <- rbind(dfTrainActivity, dfTestActivity)
dfSubject <- rbind(dfTrainSubject, dfTestSubject)

# Assign proper namings into data frames
colnames(dfFeatures) <- t(dfFeatureNames[2])
colnames(dfActivity) <- "Activity"
colnames(dfSubject) <- "Subject"

# Merge the feature, activity and subject data sets into a single data set
dfMergedData <- cbind(dfFeatures, dfActivity, dfSubject)


## 3. Extracts only the measurements on the mean & std dev. for each measurement #########
##########################################################################################
# Get column names with mean and std dev.
columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(dfMergedData), ignore.case=TRUE)

# Add back the last 2 columns which stores the activity and subject
requiredColumns <- c(columnsWithMeanSTD,562,563)

# Extract only mean & standard deviation measurements
dfExtractedData <- dfMergedData[,requiredColumns]


## 4. Uses descriptive activity names to name the activities in the data set #############
##########################################################################################
# Change Activity column to type character from numeric 
dfExtractedData$Activity <- as.character(dfExtractedData$Activity)

# Update activity names from dfActivityLabels meta data 
for (i in 1:6){
    dfExtractedData$Activity[dfExtractedData$Activity == i] <- as.character(dfActivityLabels[i,2])
}

# Factoring the activity column
dfExtractedData$Activity <- as.factor(dfExtractedData$Activity)


# 5. Appropriately labels the data set with descriptive variable names ###################
##########################################################################################
names(dfExtractedData)<-gsub("Acc", "Accelerometer", names(dfExtractedData))
names(dfExtractedData)<-gsub("Gyro", "Gyroscope", names(dfExtractedData))
names(dfExtractedData)<-gsub("BodyBody", "Body", names(dfExtractedData))
names(dfExtractedData)<-gsub("Mag", "Magnitude", names(dfExtractedData))
names(dfExtractedData)<-gsub("^t", "Time", names(dfExtractedData))
names(dfExtractedData)<-gsub("^f", "Frequency", names(dfExtractedData))
names(dfExtractedData)<-gsub("tBody", "TimeBody", names(dfExtractedData))
names(dfExtractedData)<-gsub("-mean()", "Mean", names(dfExtractedData), ignore.case = TRUE)
names(dfExtractedData)<-gsub("-std()", "STD", names(dfExtractedData), ignore.case = TRUE)
names(dfExtractedData)<-gsub("-freq()", "Frequency", names(dfExtractedData), ignore.case = TRUE)
names(dfExtractedData)<-gsub("angle", "Angle", names(dfExtractedData))
names(dfExtractedData)<-gsub("gravity", "Gravity", names(dfExtractedData))


# 6. Creates a 2nd, independent tidy data set with the ###################################
##   average of each variable for each activity and each subject. ########################
##########################################################################################
# Set Subject column as a factor variable
dfExtractedData$Subject <- as.factor(dfExtractedData$Subject)
dfExtractedData <- data.table(dfExtractedData)

# Need to call library(data.table) in my R environment as it is not pre-loaded ....

# Create a tidy data set with average for each activity and subject
dfTidyData <- aggregate(. ~Subject + Activity, dfExtractedData, mean)

# Order the tidy data set based on subject and activity
dfTidyData <- dfTidyData[order(dfTidyData$Subject,dfTidyData$Activity),]

# Write the updated data set into Tidy Data.txt 
write.table(dfTidyData, file = "Tidy Data.txt", row.names = FALSE)
