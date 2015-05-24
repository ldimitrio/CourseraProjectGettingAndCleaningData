# CourseraProjectGettingAndCleaningData
The file run_analysis.R reads the data files considering 
that in your working directory there is the Repository called "UCI HAR DATASET".

The files needs only to be launched. It will create several dataframes and a file named 
"dataset_Coursera_prject.txt"

The file selects the interesting data by using the function grep that recognize the substring "mean()" and
"std()" for each variable in the data set features. 

Then a new dataset with only the important data is created; the subject ids and activity ids and names are added to 
the data set. The function arrange creates a new indipendent data set with the avarege of each variable for each
activity and subject.
