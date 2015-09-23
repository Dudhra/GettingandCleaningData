### Code Book

1. Read the Train data X, Y and Subject in X_Train, Y_Train and Subject_Train variables respectively.
2. Read the Test data X, Y and Subject in X_Test, Y_Test and Subject_Test variables respectively.
3. Merged both train and test data parts in respective data parts and store them in X_Joined, Y_Joined and Sibject_Joined variables.
4. Read featres.txt and extracts the indices of only the measurements on the mean and standard deviation for each measurement and store them in TargetIndeces.
5. Use TargetIndeces to pick the desired instances.
6. Read activity_labels.txt and update the respective label in Y_Joined with descriptive name.
7. Appropriately labels the data set with descriptive variable names in Subject_Joined and Y_Joined and X_Joined
8. Generated TidyDataSet by combining X_Joined, Y_Joined and Subject_Joined using cbind function.
9. Iterate over all the subject and prepare average dataset.