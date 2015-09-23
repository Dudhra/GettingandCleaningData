# Step1 - Merges the training and the test sets to create one data set.

# Step1.1 - Read Training Data

X_Train <- read.table("UCI HAR Dataset\\train\\X_train.txt")
Y_Train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
Subject_Train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

# Step1.2 - Read Test Data

X_Test <- read.table("UCI HAR Dataset\\test\\X_test.txt")
Y_Test <- read.table("UCI HAR Dataset\\test\\y_test.txt") 
Subject_Test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

# Step1.3 - Merge Train and Test Dataset

X_Joined <- rbind(X_Train, X_Test)
Y_Joined <- rbind(Y_Train, Y_Test)
Subject_Joined <- rbind(Subject_Train, Subject_Test)

# Step2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("UCI HAR Dataset\\features.txt")
TargetIndeces <- grep("mean\\(\\)|std\\(\\)", features[, 2])
X_Joined <- X_Joined[, TargetIndeces]

# Step3 - Uses descriptive activity names to name the activities in the data set

Activity_Labels <- read.table("UCI HAR Dataset\\activity_labels.txt")
Y_Joined[, 1] <- Activity_Labels[Y_Joined[, 1], 2]

# Step4 - Appropriately labels the data set with descriptive variable names. 

names(Subject_Joined) <- "subject"
names(Y_Joined) <- "activity"
names(X_Joined) <- features[TargetIndeces, 2]
TidyDataSet <- cbind(Subject_Joined, Y_Joined, X_Joined)
write.table(TidyDataSet, "TidyDataSet.txt")

# Step5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

AverageData <- matrix(NA, nrow=180, ncol=68) 
AverageData <- as.data.frame(AverageData)
colnames(AverageData) <- colnames(TidyDataSet)
row <- 1
UniqueSubjects <- sort(unique(Subject_Joined)[, 1])
for(i in 1 : 30) 
{
	for(j in 1 : 6) 
	{
		AverageData[row, 1] <- UniqueSubjects[i]
		AverageData[row, 2] <- toString(Activity_Labels[j, 2])
		AverageData[row, 3:68] <- colMeans(TidyDataSet[(i == TidyDataSet$subject)&(Activity_Labels[j, 2] == TidyDataSet$activity), 3:68])
		row <- row + 1
	}
}
head(AverageData)
write.table(AverageData, "AverageDataSet.txt", row.name=FALSE)