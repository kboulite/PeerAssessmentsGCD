##clean workspace 
rm(list = ls())

##loading needed library : string
library("stringr")

####################################################################
############   QUESTION 1 ##########################################
#    Merges the training and the test sets to create one data set  #
####################################################################

## read Test data in variable data_test from the file X_test  
data_test<-read.table("UCI HAR Dataset\\test\\X_test.txt",header=F)
## read Test data in variable data_train from the file X_train  
data_train<-read.table("UCI HAR Dataset\\train\\X_train.txt",header=F)

## read  Test activity label  from y_test.txt  
activity_test<-read.table("UCI HAR Dataset\\test\\y_test.txt",header=F)
## set the colname for activities
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
###############################################################################################
# read the file Activty.txt
activity_labels<-read.table("UCI HAR Dataset\\activity_labels.txt",header=F)

#convert values to character
activity_labels$V1 <- as.character(activity_labels$V1)
activity_labels$V2 <- as.character(activity_labels$V2)

## replace  each activity code by its label
for (i in 1:6) meanStd_data$Activity[meanStd_data$Activity==activity_labels[i,]$V1]<-activity_labels[i,]$V2

################################################################################################
######################### END QUESTION 3 #######################################################
################################################################################################
 
library(reshape2)
# put data set in long format
melt_full_data<-melt(meanStd_data,id=c("Subject","Activity"))

#calculate the mean for each variables and put data set in wide format
tidy_full_data<- dcast(melt_full_data, Subject + Activity ~ variable, mean)

# add prefix to column names
colnames(tidy_full_data) <- paste("Mean_", colnames(tidy_full_data), sep = "_")
colnames(tidy_full_data)[1]<-'Subject'
colnames(tidy_full_data)[2]<-'Activity'

#write data set in file "tidy_data.txt"
write.table(tidy_full_data, file = "tidy_data.txt", sep = "\t",
            qmethod = "double",row.names = F)


