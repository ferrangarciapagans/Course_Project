Course_Project
==============

# Getting and Cleaning Data, Course Project

## Script Files Included
* run_analysis.R
* Task_1.R
* Task_2.R
* Task_3.R

## run_analysis.R
This scriot executes sequentially Task_1.R, Task_2.R and Task_3.R

## Task_1.R
This script:
* Creates a dataset with training and the test sets.
* Add subject and activity id to the dataset.
* Uses activity_labels.txt to name the activities in the data set. 
* Uses features.txt to name the dataset variables.
* Stores this data set in ./procesed_data/completeDataset.txt

## Task_2.R
This script:
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Creates a new dataset with no mean and standard deviation.
* Stores this new dataset in ./procesed_data/firstDataset.txt

## Task_3.R
This script:
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Store this data set into ./procesed_data/secondDataset.txt

