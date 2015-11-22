## run_analysis.r creates a tidy data set from UCI Accelerometer data.

This script is run by calling 'runAnalysis(workingDir)', where workingDir is the root directory of the UCI data.
The root directory should contain at least these files:
- "test/X_test.txt"
- "train/X_train.txt"
- "test/y_test.txt"
- "train/y_train.txt"
- "test/subject_test.txt"
- "train/subject_train.txt"
- "activity_labels.txt"
	
The function runAnalysis is the only function visible to the end user. Inside runAnalysis there are six other functions:

##### mergeTrainAndTest

- This function reads files from the test and train directory and merges them by column into a master data frame.
- This function uses buildFrame as a utility function to combine similar files from test and train by row before they are combined in the master data frame.

##### buildFrame

- This function returned a combined dataframe of two dataframes from files by row. 
- This requires each dataframe to have the same columns.


##### extractMeanStd

- This function extracts interesting columns from the dataframe that has been passed in.

##### labelDataSet

- This function assigns human-readable column names to the data frame

##### createTidyData

- This function groups the dataframe by apply a mean to each row grouped by subject name and activity.

##### nameActivities

- This function replaces the numeric activity values with the human-readable name of the activity.
