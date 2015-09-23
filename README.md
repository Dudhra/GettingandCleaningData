# GettingandCleaningData 
1. First of all downlod data from the url
2. Extract the data in the current working directory. A folder name "UCI HAR Dataset" will be created which will include all the data file
3. Place run_analysis.R in the currect working directory.
4. Execute the script using source('run_analysis.r')
5. Two files will be generated named "AverageDataSet.txt" and "TidyDataSet.txt". 
TidyDataSet.txt contains all the merged data where as AverageDataSet.txt contains data only with the average of each variable for each activity and each subject.