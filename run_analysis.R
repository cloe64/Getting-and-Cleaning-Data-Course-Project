################################
#STEP1
#Merges the training and test sets to creat one data set
################################
library(plyr)
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
#Creat X data set
x_data<-rbind(x_train,x_test)
#Creat Y data set
y_data<-rbind(y_train,y_test)
#Creat Subject data set
subject_data<-rbind(subject_train,subject_test)
names(subject_data)<-"subjectID"
###############################
#STEP2
#Extracts only measurements on the mean and standard deviation for each measurement
##############################
features<-read.table("UCI HAR Dataset/features.txt")
mean_std_column<-grep("-(mean|std)\\(\\)",features[,2])
###subset the data set for mean and standard features
x_data<-x_data[,mean_std_column]
##Paste column names
names(x_data)<-features[mean_std_column,2]
###############################
#STEP3
#Uses Descriptive Activity names to name the acitivies in the data set
###############################
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
y_data[,1]<-activity[y_data[,1],2]
names(y_data)<-"activity"
###############################
#STEP4
#LABLE Data set with Descriptive variable names
##############################
#Combine all data together
##############################
data<-cbind(subject_data,y_data,x_data)
################################
#Creat A Second Independent tidy data set with the average of each variable 
#for each acitivity and each subject
################################
mean_data<-ddply(data,.(subjectID,activity),function(x)colMeans(x[, 3:68]))
write.table(mean_data,"mean_data.txt",row.name=FALSE)