PeerAssessmentsGCD
==================

Peer Assessments /Getting and Cleaning Data Course Project
 


Merges the training and the test sets to create one data set  
reading the files :  'X_test.txt', 'file X_train.txt','subject_test.txt','activity_test.txt'


data_test<-cbind(subject_test,data_test)

## read  train activity label in activity_train from y_train.txt  
activity_train<-read.table("UCI HAR Dataset\\train\\y_train.txt",header=F)
## set the colname for activities
names(activity_train)<-'Activity'
## read subject train in subject_train from subject_train.txt	
subject_train<-read.table("UCI HAR Dataset\\train\\subject_train.txt",header=F)

## set the colname for subject
names(subject_train)<-'Subject'

## merge the 3 dataSet to data_train
data_train<-cbind(subject_train,data_train)
data_train<-cbind(activity_train,data_train)

## merge data_test and data_train  in  full_data
full_data<-rbind(data_train,data_test)

####################################################################
############  END QUESTION 1 #######################################
####################################################################

################################################################################################
######################### QUESTION 4 ###########################################################
#        Appropriately labels the data set with descriptive variable names                     #
################################################################################################
## read  column names from features.txt
features<-read.table("UCI HAR Dataset\\features.txt",header=F)
## Add Activities and subject column name
features[1]<-features[1]+2
nr<-data.frame(V1=2,V2="Subject")
features<-rbind(nr,features) 
nr<-data.frame(V1=1,V2="Activity")
features<-rbind(nr,features)
## set column names of Data set  
names(full_data)<-t(features$V2)
################################################################################################
############################ END QUESTION 4 ####################################################
################################################################################################

 Extracts only the measurements on the mean and standard deviation for each measurement#########
 we keep also Activty and Subject #############################################################


 Uses descriptive activity names to name the activities in the data set
 read labels from  "UCI HAR Dataset\\activity_labels.txt"
 repalce the activities code by its labels : WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS;SITTING; STANDING LAYING;

 Create a  tidy data set with the average of each variable for each activity and each subject. 
 firslty it puts data set on long format
 than by calculying  the mean it puts the data set on wide format
 add a prefix 'Mean_' at variables labels Except : 'Activity' and 'Subject'
 write the data set in a file 'tidy_data.txt'



The directory includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md' :Shows information about the variables used on the final tidy data set

- 'run_analysis.R': script R processing the source files to produce the final tidy data 

