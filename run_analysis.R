########################################
## Class:       Coursera Getting and Cleaning Data.
## Assignment:  Course Project.
## Filename:    run_analysis.R.
## Date:        9/14/2014
## Data:        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Code book:   CodeBook.R
## Readme:      README.md
########################################

rm(list=ls())

########################################
## Read in training data sets.
########################################
dir1 = "train\\"

## Read in subject_train.txt.
f1 = "subject_train.txt"
filex = paste(dir1, f1, sep = "")
df1_s <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, dec = ".", colClasses = "numeric")

## Read in y_train.txt.
f1 = "y_train.txt"
filex = paste(dir1, f1, sep = "")
df1_a <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, dec = ".", colClasses = "numeric")

## Read in X_train.txt.
f1 = "X_train.txt"
filex = paste(dir1, f1, sep = "")
df1 <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, dec = ".", colClasses = "numeric")

## Create blank column to store activity labels.
dfBlank <- data.frame(activityLabel = rep("temp", times=7352), stringsAsFactors=FALSE )

## Combine into one training set.
dfTrain <- cbind(df1_s, df1_a, dfBlank, df1)

## Add temporary column names.
n1 <- c("sub", "act", "activityLabel", 1:561)
colnames(dfTrain) <- n1

########################################
## Read in test data sets.
########################################
dir1 = "test\\"

## Read in subject_test.txt.
f1 = "subject_test.txt"
filex = paste(dir1, f1, sep = "")
df1_s <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, dec = ".", colClasses = "numeric")

## Read in y_test.txt.
f1 = "y_test.txt"
filex = paste(dir1, f1, sep = "")
df1_a <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, dec = ".", colClasses = "numeric")

## Read in X_test.txt.
f1 = "X_test.txt"
filex = paste(dir1, f1, sep = "")
df1 <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, dec = ".", colClasses = "numeric")

## Create blank column to store activity labels.
dfBlank <- data.frame(activityLabel = rep("temp", times=2947), stringsAsFactors=FALSE )

## Combine into one test set.
dfTest <- cbind(df1_s, df1_a, dfBlank, df1)

## Add temporary column names.
n1 <- c("sub", "act", "activityLabel", 1:561)
colnames(dfTest) <- n1

########################################
## 1.  Merge training and test data sets.
##      Note that the following command yielded different means.
##      dfbig <- merge(dfTrain, dfTest, all = TRUE )
########################################
dfbig <- rbind(dfTrain, dfTest)

########################################
## 2.  Extract only the measurments on the mean and standard deviation for each measurement.
########################################
dir1 = ".\\"

## Read in features.txt.
f1 = "features.txt"
filex = paste(dir1, f1, sep = "")
df1 <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, quote = "\"")

## Extract mean() and std() functions from features.txt.
m1 <- grep( "mean()" , as.character(df1[,2]) , fixed = TRUE)
s1 <- grep( "std()" , as.character(df1[,2]) , fixed = TRUE)

## Combine and order numerically.
m1s1 <- c(m1,s1)
m1s1 <- m1s1[order(m1s1)]

## Combine sub and act temporary column names.
m1s1 <- c( "sub", "act", "activityLabel", m1s1)

## Now ready to extract.
dfbig <- dfbig[, m1s1]

########################################
## 3.  Use descriptive activity names.
########################################
dir1 = ".\\"

## Read in activity_labels.txt.
f1 = "activity_labels.txt"
filex = paste(dir1, f1, sep = "")
df1 <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, quote = "\"", stringsAsFactors=FALSE)

## Update the 3rd "temp" column with activity labels.  Need to have stringsAsFactors=FALSE for this to work.
##      Otherwise, get warning messages: 1: In `[<-.factor`(`*tmp*`, iseq, value = "WALKING") :
##        invalid factor level, NA generated
for (i in 1:10299) 
{
        for (j in 1:6)
        {
                if (dfbig[i, 2] == df1[j, 1])
                {
                        dfbig[i, 3] <- df1[j, 2]
                }
        }
}


########################################
## 4.  Set descriptive variable or column names.
########################################
dir1 = ".\\"

## Read in activity_labels.txt.
f1 = "features.txt"
filex = paste(dir1, f1, sep = "")
df1 <- read.table(filex, header=FALSE, sep = "", strip.white = TRUE, quote = "\"", stringsAsFactors=FALSE)

##df2 <- colnames(dfbig)

## Extract features in dfbig
df2 <- df1[,1] %in% colnames(dfbig)
df2 <- df1[df2, ][,]

## df3 <- c("subject", "activity", "activityLabel", df2[,2])

colnames(dfbig) <- c("subject", "activity", "activityLabel", df2[,2]) 

########################################
## 5. Create data set with the mean for each variable for each activity and each subject.
########################################

library(plyr)

dftidy <- ddply(dfbig, .(subject, activity, activityLabel), function(dfbig){ colMeans(dfbig[,4:69]) }) 

## dim(dftidy)
##[1] 180  69

########################################
## 6. Create txt file using write.table() with row.name=FALSE.
########################################

## Eliminate extra activity column. 
dftidy2 <- dftidy[, 1]
colnames(dftidy2)
dftidy3 <- dftidy[, 3:69]
dftidy <- cbind(dftidy2, dftidy3)

## Change column names so that new means have _mean attached to their names.
colnames(dftidy) <- c("subject", "activityLabel", sub("*", "mean_", df2[,2] )  ) 

write.table(dftidy, file = "tidyData.txt", sep = ",", row.name=FALSE)


########################################
## eof (end of file)
########################################