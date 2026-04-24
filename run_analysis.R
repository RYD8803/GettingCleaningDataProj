#load dependencies
library(dplyr)

# Download and Read Data
#Create directory peerdata if it's not exist
if (!file.exists("peerdata")){
    dir.create("peerdata")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download zip file
download.file(fileUrl, destfile = "./peerdata/peerdata.zip", method = "curl")

#verifying zip file downloaded
list.files("./peerdata")
dateDownloaded <- date()
dateDownloaded

unzip("./peerdata/peerdata.zip", exdir = "./peerdata")
# Check contents of unzipped files
list.files("./peerdata")

# Merge the training and tests dataset
#accessing main directory
main_dir <- "./peerdata/UCI HAR Dataset"
setwd(main_dir)

#read the feature_info.txt
features <- read.table("features.txt")
features <- features[,2]

#read the activity_label.txt
act_label <- read.table("activity_labels.txt")

## Train dataset
#setting train directory
train_dir <- "./peerdata/UCI HAR Dataset/train"
setwd(train_dir)

#reading text file
X_train <- read.table("X_train.txt")
Y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#creating train dataset
train_data <- bind_cols(X_train, Y_train, subject_train)

#renaming the two new columns
names(train_data)[562] = "Activity"
names(train_data)[563] = "Subject"
names(train_data)[1:561] = features

## Test dataset
#setting train directory
test_dir <- "./peerdata/UCI HAR Dataset/test"
setwd(test_dir)

#reading text file
X_test <- read.table("X_test.txt")
Y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

#creating test dataset
test_data <- bind_cols(X_test, Y_test, subject_test)

#renaming the two new columns
names(test_data)[562] = "Activity"
names(test_data)[563] = "Subject"
names(test_data)[1:561] = features

## Merge both datasets
#combine both data
combined_data <- bind_rows(train_data, test_data)

# Keeping mean() and std()
## mean() data
#finding mean() in the colname
colname <- names(combined_data)
mean_cols <- grep("mean\\(\\)", colname)

#subsetting the combine data for mean() only
mean_data <- combined_data[,mean_cols]

## std() data
#finding std() in the colname
colname <- names(combined_data)
std_cols <- grep("std\\(\\)", colname)

#subsetting the combine data for std() only
std_data <- combined_data[,std_cols]

## Filtering only the std() and mean() for the dataset
#subsetting the activity and subject data
activ <- combined_data[562]
subject <- combined_data[563]

#new dataset with only mean, std, activity, and subject
new_dataset <- bind_cols(subject, activ, std_data, mean_data)
# Renaming the activities
new_dataset$Activity <- act_label[new_dataset$Activity, 2]

# Creating tidy dataset for each subject and activity
tidy_dataset <- new_dataset %>%
    group_by(Subject, Activity) %>%
    summarize(across(everything(), mean))
setwd("./peerdata")

#write the dataset
write.table(tidy_dataset, "tidy_dataset_peer.txt", row.names = FALSE)
list.files(".")

