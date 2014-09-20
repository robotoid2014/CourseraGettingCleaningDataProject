---
title: "Code Book for Coursera Getting and Cleaning Data Course Project"
author: "https://github.com/robotoid2014"
date: "Friday, September 19, 2014"
output: html_document
---
#Code book
###Data Dictionary

Summary: The tidy data set contains 180 rows and 68 columns.  
The tidy data set contains the mean of the mean() or std() of each feature per subject per activity.  
Please see the README file for instructions.  
    
1. subject. Person volunteer, age 19-48, randomly partitioned into two sets (Training, Test).
    + Data type: integer 1-30
    + Sample data:
        + Training subjects: 1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30
        + Test subjects: 2 4 9 10 12 13 18 20 24  

2. activityLabel. Each volunteer performed six activities.
    + Data type: chr
    + Sample data.
        + 1. WALKING
        + 2. WALKING_UPSTAIRS
        + 3. WALKING_DOWNSTAIRS
        + 4. SITTING
        + 5. STANDING
        + 6. LAYING   

3. 66 selected features: 
        + Only 66 of the 561 features have mean() or std() as part of their names.
          These 66 were selected for the tidy data set.
          The features with mean and std without the "()" were not included because features like  
          meanFreq() are weighted averages, a different calculation than average.  
        + Note that other than adding on "mean_" as a prefix, the original names were kept    
          to make it easier to match the features back to the original features.  
        + Please refer to the source's readme.txt and features_info.txt for details of the features.  However, a summary is below.  
        + Data type: numeric.  
        + Sample data: 0.27733076 -0.01738382
        
    1.  mean_tBodyAcc-mean()-X  
    2.	mean_tBodyAcc-mean()-Y  
    3.	mean_tBodyAcc-mean()-Z  
    4.	mean_tBodyAcc-std()-X  
    5.	mean_tBodyAcc-std()-Y  
    6.	mean_tBodyAcc-std()-Z  
    7.	mean_tGravityAcc-mean()-X  
    8.	mean_tGravityAcc-mean()-Y  
    9.	mean_tGravityAcc-mean()-Z  
    10.	mean_tGravityAcc-std()-X  
    11.	mean_tGravityAcc-std()-Y  
    12.	mean_tGravityAcc-std()-Z  
    13.	mean_tBodyAccJerk-mean()-X  
    14.	mean_tBodyAccJerk-mean()-Y  
    15.	mean_tBodyAccJerk-mean()-Z  
    16.	mean_tBodyAccJerk-std()-X
    17.	mean_tBodyAccJerk-std()-Y
    18.	mean_tBodyAccJerk-std()-Z
    19.	mean_tBodyGyro-mean()-X
    20.	mean_tBodyGyro-mean()-Y
    21.	mean_tBodyGyro-mean()-Z
    22.	mean_tBodyGyro-std()-X
    23.	mean_tBodyGyro-std()-Y
    24.	mean_tBodyGyro-std()-Z
    25.	mean_tBodyGyroJerk-mean()-X
    26.	mean_tBodyGyroJerk-mean()-Y
    27.	mean_tBodyGyroJerk-mean()-Z
    28.	mean_tBodyGyroJerk-std()-X
    29.	mean_tBodyGyroJerk-std()-Y
    30.	mean_tBodyGyroJerk-std()-Z
    31.	mean_tBodyAccMag-mean()
    32.	mean_tBodyAccMag-std()
    33.	mean_tGravityAccMag-mean()
    34.	mean_tGravityAccMag-std()
    35.	mean_tBodyAccJerkMag-mean()
    36.	mean_tBodyAccJerkMag-std()
    37.	mean_tBodyGyroMag-mean()
    38.	mean_tBodyGyroMag-std()
    39.	mean_tBodyGyroJerkMag-mean()
    40.	mean_tBodyGyroJerkMag-std()
    41.	mean_fBodyAcc-mean()-X
    42.	mean_fBodyAcc-mean()-Y
    43.	mean_fBodyAcc-mean()-Z
    44.	mean_fBodyAcc-std()-X
    45.	mean_fBodyAcc-std()-Y
    46.	mean_fBodyAcc-std()-Z
    47.	mean_fBodyAccJerk-mean()-X
    48.	mean_fBodyAccJerk-mean()-Y
    49.	mean_fBodyAccJerk-mean()-Z
    50.	mean_fBodyAccJerk-std()-X
    51.	mean_fBodyAccJerk-std()-Y
    52.	mean_fBodyAccJerk-std()-Z
    53.	mean_fBodyGyro-mean()-X
    54.	mean_fBodyGyro-mean()-Y
    55.	mean_fBodyGyro-mean()-Z
    56.	mean_fBodyGyro-std()-X
    57.	mean_fBodyGyro-std()-Y
    58.	mean_fBodyGyro-std()-Z
    59.	mean_fBodyAccMag-mean()
    60.	mean_fBodyAccMag-std()
    61.	mean_fBodyBodyAccJerkMag-mean()
    62.	mean_fBodyBodyAccJerkMag-std()
    63.	mean_fBodyBodyGyroMag-mean()
    64.	mean_fBodyBodyGyroMag-std()
    65.	mean_fBodyBodyGyroJerkMag-mean()
    66.	mean_fBodyBodyGyroJerkMag-std()  
    
    
4.  Summary from features_info.txt regarding what the features represent.  
    Further clarification by contacting the source of the data might be a good idea for a concise and detailed recipe  
    covering all manipulation of raw data.
    + Acc: accelerometer 3-axial signals.
    + Body: body linear acceleration signals.  Accelerometer signal using low pass Butterworth filter with corner frequency of 0.3 Hz.
    + f: frequency domain signals.  Fast Fourier Transform (FFT) was applied to these.
    + Gravity: accelerometer signal using low pass Butterworth filter with corner frequency of 0.3 Hz.
    + Gyro: gyroscope 3-axial signals.
    + Jerk: angular velocity signals.
    + Mag: magnitude calculated using Euclidean norm.
    + mean(): mean value.
    + std(): standard deviation.
    + t: time domain signals captured at constant rate of 50 Hz.
    + XYZ: 3-axial signals in the X, Y and Z directions.  
    
    
5.  Units of features: It appears that Acc features are gravity and Gyro are radians/second.
    + The acceleration signals are standard gravity units "g" in the Inertial Signals directory.
    + The angular velocity signals from the gyroscope are radians/second in the Inertial Signals directory.  
    
    
    
    
    