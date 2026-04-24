# **Project Overview**

The goal of this project is to clean the data and produce a tidy dataset suitable for analysis. The dataset was acquired from the Human Activity Recognition Using Smartphones dataset project. All of the data were collected from the accelerometers and gyroscopes of smartphones worn by 30 participants performing various activities.

# **Files included**

- `run_analysis.R`\
  Script that performs all data cleaning steps and generates the tidy dataset.

- `tidy_dataset_peer.txt`\
  Final tidy dataset containing the average of each variable for each activity and subject.

- `CodeBook.md`\
  Describes the variables, dataset, and transformations applied.

**Data Transformation Steps**

The following steps were performed to clean the data:

1.  Training and test datasets were merged separately and all of the featured measurements were labeled with descriptive variable names
2.  Both of the training and test datasets were then merged into single dataset
3.  All the activity IDs were replaced with its corresponding descriptive activity names
4.  All the measured variable were replaced with its descriptive names
5.  Created a second tidy dataset containing the average of each variable for each subject and activity

No missing values were introduced during processing

# **How to Run**

1.  Download and unzip the dataset into your working directory

2.  Run the script:

```         
source("run_analysis.R")
```

3.  The output file `tidy_dataset_peer.txt` will be generated in the working directory

# **Notes**

For Windows users, please check the written directory from the script before running.
