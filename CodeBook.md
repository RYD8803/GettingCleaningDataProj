**Dataset Description**

The goal of this project is to clean the data and produce a tidy dataset suitable for analysis. The dataset was acquired from the Human Activity Recognition Using Smartphones dataset project. All of the data were collected from the accelerometers and gyroscopes of smartphones worn by 30 participants performing various activities.

**Identifier Variables**

- Subject: participant who performed the activity

- Activity: activities that were performed by the subject, which includes:

  - Walking

  - Walking upstairs

  - Walking downstairs

  - Sitting

  - Landing

  - Laying

Measurement Variables

These variables were collected from smartphone sensors:

- Body acceleration signals

- Gravity acceleration signals

- Gyroscope signals

Each measured variables have mean() and std() measurements, which can be seen in the tidy_dataset_peer.txt.

#### Variable Naming Convention

Variable names are constructed as follows:

-  t: Time domain signal

-  f: Frequency domain signal

-  BodyAcc: Body acceleration

-  GravityAcc: Gravity acceleration

-  Gyro: Gyroscope measurements

-  mean(): Mean value of the signal

-  std(): Standard deviation of the signal

-  X, Y, Z: Directional axes

Example: tBodyAcc-mean()-X represent mean of body acceleration in X direction (time domain).

**Data Transformation Steps**

The following steps were performed to clean the data:

1.  Training and test datasets were merged separately and all of the featured measurements were labeled with descriptive variable names
2.  Both of the training and test datasets were then merged into single dataset
3.  All the activity IDs were replaced with its corresponding descriptive activity names
4.  Created a second tidy dataset containing the average of each variable for each subject and activity

No missing values were introduced during processing

**Tidy Dataset**

Each row represent combination of subject and activity, while each column represent the measurement variable. The value on the dataset represent the average of each measured variable for the given subject and activity.
