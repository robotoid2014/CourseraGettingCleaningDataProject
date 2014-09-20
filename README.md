---
title: "README for Coursera Getting and Cleaning Data Course Project"
author: "https://github.com/robotoid2014"
date: "Friday, September 19, 2014"
output: html_document
---

## Included
* Raw data:     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
    + Note that the raw data from this source has been manipulated.  (See downloaded features_info.txt and readme.txt.)   
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
    
9.  Test results.  (R script not included here.)
    + For train example: 
        + Subject 1 is in the train file rows 1 -347.  
        + Activity 1 for Subject 1 is rows 79:125 & rows 249-296.  
        + X_Train mean of first 6 features for Subject 1, Activity 1:
            + 0.27733076 -0.01738382 -0.11114810 -0.28374026  0.11446134 -0.26002790  
        + Tidy data set first row:  
            +  1 WALKING 0.2773308  -0.01738382  -0.1111481  -0.2837403  0.1144613 -0.2600279  
    + For test example: 
        + Subject 24 is in the test file rows 2567 - 2947.  
        + Activity 4 for Subject 24 is rows 2600 - 2633 & 2790 - 2823.  
        + X_Test mean of features for Subject 24, Activity 4:
            + 2.734757e-01 -1.312551e-02 -1.030411e-01 -9.905938e-01 -9.562560e-01 -9.570561e-01
        + Tidy data set:  
            + 24 SITTING 0.2734757 -0.01312551 -0.1030411 -0.9905938 -0.956256 -0.9570561
    
    
10.  Here is the R command to read in the tidy data set:  
    + df1 <- read.table("tidydata.txt", header=TRUE, sep = ",", dec = ".")
    
11. Raw data notes  
    + The data from the source is all manipulated, even in the Inertial Signal subdirectories.  
    The following paper discusses some of the computations, but it does not explain
    exactly the steps involved creating the data files.  Contacting the source for 
    the unmanipulated data files and raw steps might be needed to have a thorough understanding
    of the data itself.
    +    www.icephd.org/sites/default/files/IWAAL2012.pdf
    
    
    
    
    


