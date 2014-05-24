##########################################################################
# TASK 1: Merges the training and the test sets to create one data set.  #
#                                                                        #
# The 1st objective is create a complete data set with all observations, #
# labels and subjects                                                    #
##########################################################################

# Initialize the working directory
setwd("~/DS Specialization/GetData/Project/UCI HAR Dataset")

# STEPS TO COMPLETE TASK 1:
# A- Create a complete set of observation and store it in a object called dataBody (X files)
# B- Create a complete set with all activities relates to observations and store it in 
#    an object calledactivityLabels(Y files)
# C- Labels each activity withi its activity description
# D- Create a complete set with all subjects related to all observattions and store it in 
#    an object called activitySubject.
# E- Combine all partial data sets in a single data set, store it in an object called
#    completeDataset and save it in a file called ./procesed_data/completeDataset.txt

# STEP A
# Test and Train X files contains obsevations, in order to create a data 
# frame with all train and test observations  we need to concatenate 
# train a test X tables
trainX <- read.table("./train/X_train.txt")
dim(trainX)

testX <- read.table("./test/X_test.txt")
dim(testX)

dataBody <- rbind(trainX,testX)
dim(dataBody)
# dataBody is a table with all observations

# In order to have descriptive columns names we're going to 
# load names from features.txt
featuresNames <- read.table("features.txt")
dim(featuresNames)
names(dataBody) <- featuresNames[,2]


# STEP B
# Test and Train Y files contains activities related to observations
# In order to have a complete table with all activitties related to all
# observations stored in dataBody we need to concatenate train and test Y files

trainY <- read.table("./train/Y_train.txt")
dim(trainY)

testY <- read.table("./test/Y_test.txt")
dim(testY)

activityLabels <- rbind(trainY,testY)
dim(activityLabels)

# Assing Activity_Id as column name
names(activityLabels) <- c("Activity_Id")

# STEP C
activityDesc <- read.table("activity_labels.txt")
dim(activityDesc)
names(activityDesc) <- c("Activity_Id", "Activity")

activityDescription = merge(activityLabels, activityDesc, by.x="Activity_Id", by.y="Activity_Id", sort=FALSE)
dim(activityDescription)

# STEP D
# Information related to Subject activity is stored in subject train and test files
# In order to obtain a complete file we need to contactenate both files.
# Load files
trainSubject <- read.table("./train/subject_train.txt")
dim(trainSubject)

testSubject <- read.table("./test/subject_test.txt")
dim(testSubject)

# contatenate data set into a sigle
activitySubject <- rbind(trainSubject, testSubject)
dim(activitySubject)

names(activitySubject) <- c("Subject")

# STEP D
# just for doublecheck
dim(dataBody)
dim(activitySubject)
dim(activityDescription)

# Create the complete dataset
completeDataset <- cbind(dataBody, activitySubject)
dim(completeDataset)
completeDataset <- cbind(completeDataset, activityDescription)
dim(completeDataset)

# Store the dataset into a txt file
if(!file.exists("./procesed_data")){dir.create("./procesed_data")}
write.table(completeDataset,"./procesed_data/completeDataset.txt")

