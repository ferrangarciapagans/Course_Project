##########################################################################
# TASK 2: Extracts only the measurements on the mean and standard        #
#         deviation for each measurement.                                #
#                                                                        #
#  Identify those measures that are measures of mean and standard        #
# deviation. This will reduce the number of columns in the dataset.      #
##########################################################################

# STEPS:
#  A- Load the complete dataset and store it in an object called completeDataset
#  B- Identify columns with mean and std for eache messurament

# Set the working directory
setwd("~/DS Specialization/GetData/Project/UCI HAR Dataset")

# STEP A
completeDataset <- read.table("./procesed_data/completeDataset.txt")
dim(completeDataset)

#STEP B
featuresNames <- read.table("features.txt")
iTable <- grepl("Mean|std|mean", featuresNames$V2)
indexTable <- !iTable
indexTable[562] <- TRUE # Add Subject column
indexTable[563] <- TRUE # Add Activity_Id column
indexTable[564] <- TRUE # Add Activity column


firstDataset <- completeDataset[,indexTable]
dim(firstDataset)

# Store the dataset into a txt file
if(!file.exists("./procesed_data")){dir.create("./procesed_data")}
write.table(firstDataset,"./procesed_data/firstDataset.txt")
