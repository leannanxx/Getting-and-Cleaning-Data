
library(dplyr)
library(tidyverse)

#Download dataset
  setwd("C:/Users/winz_ju/Desktop/R/Coursera_Unterlagen/3_Getting Data")
  
  if(!file.exists("./gettingdata")) {
    dir.create("./gettingdata")
  }
  
  file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(file, destfile = "./gettingdata/dataset.zip")

#Unzip
  unzip(zipfile = "./gettingdata/dataset.zip", exdir = "./gettingdata")

#Read datasets
  x_train <- read.table("./gettingdata/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./gettingdata/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./gettingdata/UCI HAR Dataset/train/subject_train.txt")
  
  x_test <- read.table("./gettingdata/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./gettingdata/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./gettingdata/UCI HAR Dataset/test/subject_test.txt")

#Read features and activity labels
  features <- read.table("./gettingdata/UCI HAR Dataset/features.txt")
  
  activitylabels <- read.table("./gettingdata/UCI HAR Dataset/activity_labels.txt")
  colnames(activitylabels) <- c("activity_ID", "activity_type")

#Variable names
  colnames(x_train) <- features[, 2]
  colnames(y_train) <- "activity_ID"
  colnames(subject_train) <- "subject_ID"
  
  colnames(x_test) <- features[, 2]
  colnames(y_test) <- "activity_ID"
  colnames(subject_test) <- "subject_ID"

#Merge datasets
  train <- cbind(x_train, y_train, subject_train)
  test <- cbind(x_test, y_test, subject_test)
  dataset_UCI <- rbind(train, test)

#Extract measurements on mean & sd only inc. IDs
  data_mean_sd <- dataset_UCI %>% select(contains("mean()"), contains("std()"), contains("ID"))

#Use descriptive activity names
  data_mean_sd_act <- merge(data_mean_sd, activitylabels, by = "activity_ID", all.x = T)

#Label data set with descriptive variable names
  colnames(data_mean_sd_act) <- gsub("^t", "time_", colnames(data_mean_sd_act))
  colnames(data_mean_sd_act) <- gsub("^f", "freq_", colnames(data_mean_sd_act))
  colnames(data_mean_sd_act) <- gsub("Acc", "_accelerometer", colnames(data_mean_sd_act))
  colnames(data_mean_sd_act) <- gsub("Gyro", "_gyroscope", colnames(data_mean_sd_act))
  colnames(data_mean_sd_act) <- gsub("Mag", "_magnitude", colnames(data_mean_sd_act))
  colnames(data_mean_sd_act) <- gsub("BodyBody", "Body", colnames(data_mean_sd_act))

#Tidy data set
  tidy_data <- data_mean_sd_act %>% group_by(subject_ID, activity_type) %>% summarize_all(mean, na.rm = T)
