##########################################################################
# TASK 3:Creates a second, independent tidy data set with the average    #
#        of each variable for each activity and each subject.            #
#                                                                        #
#  Identify those measures that are measures of mean and standard        #
# deviation. This will reduce the number of columns in the dataset.      #
##########################################################################

# STEPS:
#  A- Load the reduced dataset and store it in an object called reducedDataset
#  B- Melt the dataset and aggregate data in a second dataset
#  C- Store the new dataset 

# Set the working directory
setwd("~/DS Specialization/GetData/Project/UCI HAR Dataset")

# STEP A
firstDataset <- read.table("./procesed_data/firstDataset.txt")
dim(firstDataset)

# STEP B
library(reshape2)
test <- melt(firstDataset, id=c("Subject", "Activity"))
secondDataset <- dcast(test, Subject + Activity  ~ variable, mean)

# STEP C
# Store the dataset into a txt file
if(!file.exists("./procesed_data")){dir.create("./procesed_data")}
write.table(secondDataset,"./procesed_data/secondDataset.txt")
