---
title: "Coursera Getting and Cleaning Data Course Project"
author: "https://github.com/robotoid2014"
date: "Wednesday, September 17, 2014"
output: html_document
---

## Included
* Raw data:     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
    + Note that the data from this source is NOT raw.   
* Tidy data set: tidydata.txt  
* Code book:    CodeBook.md  
* R code:       run_analysis.R  
* Diagram:      CommunityTA_DavidHood_Diagram.png
  



## Instructions
1. Download the data from here:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the downloaded file "getdata_projectfiles_UCI HAR Dataset.zip".

3. Download run_analysis.R into the following subdirectory created in previous step:  
        "getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset"

4. Set your R Studio working directory to the subdirectory created in previous step.  
    Example: setwd("driveletter:\\somedir\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\")
   
5. The following table summarizes the downloaded data files.  
     Here is some sample R code that was run on each file to determine the dimensions and NA values:   
    + f1 = "X_train.txt"  
    + filex = paste(dir1, f1, sep = "")  
    + df <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, quote = "\"", dec = ".", fill = TRUE, na.strings = c("NA",""," "), colClasses = "numeric")  
    + dim(df1)  
    + all(colSums(is.na(df1)) == 0)  





Directory        |	File name	|	Rows	|	Columns	|	NA	|	Notes or Sample data	|
------	|	-------	|	------	|	------	|	------	|	------	|
[R working directory]	|	activity_labels.txt	|	6	|	2	|	0	|	1 WALKING, ... 6 LAYING	|
[R working directory]	|	features.txt	|	561	|	2	|	0	|	1 tBodyAcc-mean()-X, ... 561 angle(Z,gravityMean)	|
[R working directory]	|	features_info.txt	|		|		|		|	Read text	|
[R working directory]	|	README.txt	|		|		|		|	Read text	|
train	|	subject_train.txt	|	7352	|	1	|	0	|	1 3 5 6 7 8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30	|
train	|	X_train.txt	|	7352	|	561	|	0	|	0.2885845	|
train	|	y_train.txt	|	7352	|	1	|	0	|	integers 1-6	|
train\\Inertial Signals	|	body_acc_x_train.txt	|	7352	|	128	|	0	|	1.808515E-04	|
train\\Inertial Signals	|	body_acc_y_train.txt	|	7352	|	128	|	0	|	0.0107668100	|
train\\Inertial Signals	|	body_acc_z_train.txt	|	7352	|	128	|	0	|	0.055560680	|
train\\Inertial Signals	|	body_gyro_x_train.txt	|	7352	|	128	|	0	|		|
train\\Inertial Signals	|	body_gyro_y_train.txt	|	7352	|	128	|	0	|		|
train\\Inertial Signals	|	body_gyro_z_train.txt	|	7352	|	128	|	0	|		|
train\\Inertial Signals	|	total_acc_x_train.txt	|	7352	|	128	|	0	|		|
train\\Inertial Signals	|	total_acc_y_train.txt	|	7352	|	128	|	0	|		|
train\\Inertial Signals	|	total_acc_z_train.txt	|	7352	|	128	|	0	|		|
test	|	subject_test.txt	|	2947	|	1	|	0	|	2 4 9 10 12 13 18 20 24	|
test	|	X_test.txt	|	2947	|	561	|	0	|	0.2571778	|
test	|	y_test.txt	|	2947	|	1	|	0	|	integers 1-6	|
test\\Inertial Signals	|	body_acc_x_test.txt	|	2947	|	128	|	0	|	0.0116531500	|
test\\Inertial Signals	|	body_acc_y_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	body_acc_z_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	body_gyro_x_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	body_gyro_y_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	body_gyro_z_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	total_acc_x_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	total_acc_y_test.txt	|	2947	|	128	|	0	|		|
test\\Inertial Signals	|	total_acc_z_test.txt	|	2947	|	128	|	0	|		|





6. The following image from the Coursera Community TA David Hood shows how the data files fit together for the assignment.  
![data diagram](CommunityTA_DavidHood_Diagram.png)  
Copied from forum at https://class.coursera.org/getdata-007/forum/thread?thread_id=49  

7.  Tidy Data Set  
    According to https://github.com/jtleek/datasharing, a Tiny Data Set has the following:
    1. Each variable you measure should be in one column.
        + For this project, tidy data columns are:
            + subject (e.g. 1-30).
            + activityLabel (e.g. WALKING, ... LAYING).
            + 66 mean values (mean_tBodyAcc-mean()-X, ..., mean_fBodyBodyGyroJerkMag-std()).
    2. Each different observation of that variable should be in a different row.
        + For this project, tidy data rows represent the mean of the mean() or std() of each feature per subject per activity level.
    3. There should be one table for each "kind" of variable.
        + For this project, there is only one table, one file.
    4. If you have multiple tables, they should include a column in the table that allows them to be linked.
    
8.  Execute the run_analysis.R file to create the tidy data set: source("run_analysis.R")
    
9.  Test the tidy data set against both the train and test data sets.  (R script not included here, but tests were run.)
    + For train example: 
        + Subject 1 is in the train file rows 1 -347.  
        + Activity 1 for Subject 1 is rows 79:125 & rows 249-296.  
    + For test example: 
        + Subject 24 is in the test file rows 2567 - 2947.  
        + Activity 4 for Subject 24 is rows 2600 - 2633 & 2790 - 2823.  
    



