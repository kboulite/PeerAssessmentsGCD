PeerAssessmentsGCD
==================

Peer Assessments /Getting and Cleaning Data Course Project
 


####################################################################
############   QUESTION 1 ##########################################
#    Merges the training and the test sets to create one data set  #
####################################################################
read Test data in variable data_test from the file X_test  
read Test data in variable data_train from the file X_train  

read  Test activity label  from y_test.txt  

set the colname for activities

names(activity_test)<-'Activity'
## read subject test in sactivitiesubject_Test from subject_test.txt	
subject_test<-read.table("UCI HAR Dataset\\test\\subject_test.txt",header=F)

## set the colname for subject
names(subject_test)<-'Subject'

## merge the 3 dataSet to data_test
data_test<-cbind(activity_test,data_test)

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

################################################################################################
############################## QUESTION 2 ######################################################
#Extracts only the measurements on the mean and standard deviation for each measurement#########
# we keep also Activty and Subject #############################################################
################################################################################################
##extract only columns for std and mean   of course we keep Subject and Activity
std_mean<-features[which(str_detect(features$V2, 'Subject|Activity|(((M|m)ean|std)\\(\\))')),]
std_mean_colIndex<-std_mean[1]
## convert to list
std_mean_colIndex<-unlist(std_mean_colIndex)
##Extracts only the measurements on the mean and standard deviation for each measurement. 
meanStd_data<-subset(full_data,select=std_mean_colIndex)
###############################################################################################
############################ END QUESTION 2 ###################################################
###############################################################################################

###############################################################################################
######################## QUESTION 3    ########################################################
###Uses descriptive activity names to name the activities in the data set######################


read labels from  "UCI HAR Dataset\\activity_labels.txt"
 repalce the activities code by its labels : WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS;SITTING; STANDING LAYING;


 firslty it puts data set on long format
 than by calculying  the mean it puts the data set on wide format
 add a prefix 'Mean_' at variables labels Except : 'Activity' and 'Subject'
 write the data set in a file 'tidy_data.txt'



The directory includes the following files:
=========================================

- 'README.md'

- 'CodeBook.md' :Shows information about the variables used on the final tidy data set

- 'run_analysis.R': script R processing the source files to produce the final tidy data 

