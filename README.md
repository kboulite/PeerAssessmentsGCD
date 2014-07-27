PeerAssessmentsGCD
==================

Peer Assessments /Getting and Cleaning Data Course Project
 

this script reads  source data 'UCI HAR Dataset' and produce a tidy data set with 68 variables :
Subject , Activity and 66 measurements
this processing is done in 5 steps :


1- Merges the training and the test sets to create one data set  
reading the files :  'X_test.txt', 'X_train.txt','Y_test.txt','Y_train.tst','activity_train.txt','activity_test.txt','subject_train.txt','subject_test.txt',


2- reads variables names from the file 'UCI HAR Dataset\\features.txt' then 
 set appropriately labels the data set with descriptive variable names                     


3- Extracts only the measurements on the mean and standard deviation for each measurement
 we keep also Activty and Subject  (subset with columns that contain 'Mena()' and 'std()' 


4- Uses descriptive activity names to name the activities in the data set
 read labels from  "UCI HAR Dataset\\activity_labels.txt"
 repalce the activities code by its labels : WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS;SITTING; STANDING LAYING;

5- Create a  tidy data set with the average of each variable for each activity and each subject. 
 firslty it puts data set on long format
 than by calculying  the mean it puts the data set on wide format
 add a prefix 'Mean_' at variables labels Except : 'Activity' and 'Subject'
 write the data set in a file 'tidy_data.txt'



The directory includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md' :Shows information about the variables used on the final tidy data set

- 'run_analysis.R': script R processing the source files to produce the final tidy data 

