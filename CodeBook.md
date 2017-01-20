# Getting and Cleaning Data Project

WEN CHE

Description

Varibles, the data and extra transformation are listed for this project.

Details

The script 'run_analysis.R' has 5 stpes following the course project's descriptions.
 
 First all the datasets with same prefix are combined by 'rbind()' function. 
 And the names of dataset are named by corresponding predix.
 
 The indexs of the features with 'mean' or 'std' are extracted from 'features.txt'. 
 The columns with mean or std in x data are taken by the index and given by the correct names.
 
 The acitivity names and ID are taken from 'activity_labels.txt'.
 The values in y data are replaced by the activity labels.
 
 The x/y/subject datas are merged into the whole data.
 
 Finally, the final dataset are generated with average for the features by each subject and each activity (180 rows)
 It is called 'mean_data.txt'.
 
 Files and Variables
 
 input files 'x_train.txt' 'y_train.txt' 'x_test.txt' 'y_test.txt' 'activity_labels.txt' 'features.txt'
 
 output files/variables
               'x_data' 'y_data' 'subject_data'
               'features' (561 features) has columns names for 'x_data' which are used to extract the desired data (66 columns).
               'activity' has activity labels (6 activities) which are used to substitute the numbers in 'y_data'
               'data' contains the all data
               'mean_data.txt' has average values by 'ddply()' of plyr package with 'colMeans' function
 
