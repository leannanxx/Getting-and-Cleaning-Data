## Codebook

### Data set

- The data set can be downloaded from [UCI HAR Data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  
- A description of the study the data were assessed in can be found here [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

### Single data sets

The following data sets are merged:

- train: x_train.txt, y_train.txt, subject_train.txt   
- test: x_test.txt, y_test.txt, subject_test.txt   

The following files are used for labeling the variables:

- features.txt  
- activity_labels.txt  

### Variables

- An overview of the variables can be found in the corresponding **README-file**.  
- From the original data set, only variables containing *means* and *standard deviations* were extracted for the final data set.  
- Variables were renamed using descriptive variable names.  
- For the tidy data set, *average values* for each activity for each subject were summarized.
