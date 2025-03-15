# Getting-and-Cleaning-Data
Getting and Cleaning Data_Assignment Week 4

In this repository, result files from the Getting and Cleaning Data Course Project assignment are stored. They are used for transforming the **UCI HAR Data set** into a tidy data set.

### Overview

1. **run_analysis.R:**  
- This script merges the *training* and the *test* data sets to create one data set.  
- It extracts the measurements on the mean and standard deviation for each measurement.   
- It then assigns descriptive activity names to the activities in the data set and appropriately labels the data set with descriptive variable names. 
- It finally creates an independent tidy data set with the average of each variable for each activity and each subject.

2. **Codebook.Rmd**  
- This file contains an overview of the data files used,  
- the variables  
- transformations made

3. **tidydata.txt**
- This file contains the final tidy data set including average values for each activity for each subject.

### Using these files

1. To use the files in this repository open the script **run_analysis.R** in **RStudio**.
2. Use the **Codebook.Rmd** to get an overview of all data and variables used in this repository. 
3. Run the script step by step and thus create a tidy data set resulting in a *.txt-file*.
