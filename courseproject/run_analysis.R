runAnalysis <- function(workingDir){
  
  # Merges the training and the test sets to create one data set.
  mergeTrainAndTest <- function() {
    xFrame <- buildFrame(testFile = "test/X_test.txt", 
                         trainFile = "train/X_train.txt")
    yFrame <- buildFrame(testFile = "test/y_test.txt", 
                         trainFile = "train/y_train.txt")
    sFrame <- buildFrame(testFile = "test/subject_test.txt", 
                         trainFile = "train/subject_train.txt")
    cbind(sFrame, yFrame, xFrame)
  }
  
  # Extracts only the measurements on the mean and standard deviation for each measurement
  # as well as the subject id and activity.
  extractMeanStd <- function(frame) {
    # indices of columns that we want to keep
    columnIndices <-c(
      1, 2, 3, 4, 5, 6, 7, 8, 43, 44, 45, 46, 47, 48, 83, 84, 85,
      86, 87, 88, 123, 124, 125, 126, 127, 128, 163, 164, 165, 166,
      167, 168, 203, 204, 216, 217, 229, 230, 242, 243, 255, 256,
      268, 269, 270, 271, 272, 273, 347, 348, 349, 350, 351, 352,
      426, 427, 428, 429, 430, 431, 505, 506, 518, 519, 531, 532,
      544, 545
    )
    frame[, columnIndices]
  }
  
  # Uses descriptive activity names to name the activities in the data set.
  # Reads factor data from file to enable naming
  nameActivities <- function(frame) {
    whiteSpace <- ""
    activities <- read.csv(
      file = "activity_labels.txt", 
      sep = whiteSpace,
      header = FALSE, 
      col.names = c("levels", "labels"))
    
    frame[,"Activity"] <- factor(
      frame[,"Activity"], 
      levels = activities[,"levels"], 
      labels = activities[,"labels"])
    frame
  }
  
  # Appropriately labels the data set with descriptive variable names.
  labelDataSet <- function(frame) {
    columnNames <- c(
      "Subject ID",
      "Activity",
      "Time Body Acceleration Mean X Axis", "Time Body Acceleration Mean Y Axis", "Time Body Acceleration Mean Z Axis",
      "Time Body Acceleration Standard Deviation X Axis", "Time Body Acceleration Standard Deviation Y Axis", "Time Body Acceleration Standard Deviation Z Axis",
      "Time Gravity Acceleration Mean X Axis", "Time Gravity Acceleration Mean Y Axis", "Time Gravity Acceleration Mean Z Axis",
      "Time Gravity Acceleration Standard Deviation X Axis", "Time Gravity Acceleration Standard Deviation Y Axis", "Time Gravity Acceleration Standard Deviation Z Axis",
      "Time Body Acceleration Jerk Mean X Axis", "Time Body Acceleration Jerk Mean Y Axis", "Time Body Acceleration Jerk Mean Z Axis",
      "Time Body Acceleration Jerk Standard Deviation X Axis", "Time Body Acceleration Jerk Standard Deviation Y Axis", "Time Body Acceleration Jerk Standard Deviation Z Axis",
      "Time Body Gyro Mean X Axis", "Time Body Gyro Mean Y Axis", "Time Body Gyro Mean Z Axis",
      "Time Body Gyro Standard Deviation X Axis", "Time Body Gyro Standard Deviation Y Axis", "Time Body Gyro Standard Deviation Z Axis",
      "Time Body Gyro Jerk Mean X Axis", "Time Body Gyro Jerk Mean Y Axis", "Time Body Gyro Jerk Mean Z Axis",
      "Time Body Gyro Jerk Standard Deviation X Axis", "Time Body Gyro Jerk Standard Deviation Y Axis", "Time Body Gyro Jerk Standard Deviation Z Axis",
      "Time Body Acceleration Magnitude Mean", "Time Body Acceleration Magnitude Standard Deviation",
      "Time Gravity Acceleration Magnitude Mean", "Time Gravity Acceleration Magnitude Standard Deviation",
      "Time Body Acceleration Jerk Magnitude Mean", "Time Body Acceleration Jerk Magnitude Standard Deviation",
      "Time Body Gyro Magnitude Mean", "Time Body Gyro Magnitude Standard Deviation",
      "Time Body Gyro Jerk Magnitude Mean", "Time Body Gyro Jerk Magnitude Standard Deviation",
      "Frequency Body Acceleration Mean X Axis", "Frequency Body Acceleration Mean Y Axis", "Frequency Body Acceleration Mean Z Axis",
      "Frequency Body Acceleration Standard Deviation X Axis", "Frequency Body Acceleration Standard Deviation Y Axis", "Frequency Body Acceleration Standard Deviation Z Axis",
      "Frequency Body Acceleration Jerk Mean X Axis", "Frequency Body Acceleration Jerk Mean Y Axis", "Frequency Body AccelerationJerk Mean Z Axis",
      "Frequency Body AccelerationJerk Standard Deviation X Axis", "Frequency Body AccelerationJerk Standard Deviation Y Axis", "Frequency Body AccelerationJerk Standard Deviation Z Axis",
      "Frequency Body Gyro Mean X Axis", "Frequency Body Gyro Mean Y Axis", "Frequency Body Gyro Mean Z Axis",
      "Frequency Body Gyro Standard Deviation X Axis", "Frequency Body Gyro Standard Deviation Y Axis", "Frequency Body Gyro Standard Deviation Z Axis",
      "Frequency Body Acceleration Magnitude Mean", "Frequency Body Acceleration Magnitude Standard Deviation",
      "Frequency Body Body Acceleration Jerk Magnitude Mean", "Frequency Body Body Acceleration Jerk Magnitude Standard Deviation",
      "Frequency Body Body Gyro Magnitude Mean", "Frequency Body Body Gyro Magnitude Standard Deviation",
      "Frequency Body Body Gyro Jerk Magnitude Mean", "Frequency Body Body Gyro Jerk Magnitude Standard Deviation"
    )
    
    colnames(frame) <- columnNames
    frame
  }
  
  # Creates a second, independent tidy data set with the average of each variable
  # for each activity and each subject.
  createTidyData <- function(frame) {
    frame <- aggregate(frame, FUN = mean, by = list(frame[,"Activity"], frame[, "Subject ID"]))
    subset(frame, select = -c(1, 2)) # drop 'Group.1 and Group.2 columns'
  }
  
  # Create a data frama that contains the contents of a test and training file
  buildFrame <- function(testFile, trainFile) {
    whiteSpace <- ""
    testFile <- read.csv(file = testFile, sep = whiteSpace, header = FALSE)
    trainFile <- read.csv(file = trainFile, sep = whiteSpace, header = FALSE)
    rbind(testFile, trainFile)
  }
  
  
  setwd(workingDir)
  frame <- mergeTrainAndTest()
  frame <- extractMeanStd(frame)
  frame <- labelDataSet(frame)
  frame <- createTidyData(frame)
  frame <- nameActivities(frame)
  frame
}

