## read test set and training set 
data.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
data.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
all.data <- rbind(data.test,data.train)

## read activity label for the test set and the training set 
activity.data.test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names="activity")
activity.data.train <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names="activity")
all.activity.data <- rbind(activity.data.test,activity.data.train)

## read activity labels and features
act_lab <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activity.code","activity.name"))
features <- read.table("./UCI HAR Dataset/features.txt")

## merge activity and activity label data sets so to create a data frame 
## which conserve the order of the labels for the training+test data set
## and adds the descritpion (activity name)
activity.data.described <-merge(all.activity.data,act_lab,by.x="activity",by.y="activity.code",sort=FALSE)

## Use the grep command to recognize the substring "mean()" 
## and "std()" in the features data set
## and save the index of features that matches in 
## the integer vector ext
extract1 <- grep("mean()",features$V2)
extract2 <- grep ("std()", features$V2)
ext <- sort(c(extrac1,extract2))

## Extract from the training + test set only the
## measurements on the mean and standard deviation
important.data <-all.data[,ext]

## Give features name to variables (columns) to the new data set
colnames(important.data) <- features[ext,2]

## read subjects ids in test and training data
subj.id.test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names="subject.id")
subj.id.train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names="subject.id")
all.subj <- rbind(subj.id.test,subj.id.train)

## Add activity and Subject to the data set and calculate the mean for 
## activity and subject
avarage.data.temp <- cbind(important.data,activity.data.described,all.subj)
avarage.data <- aggregate(avarage.data.temp[, 1:79],list(avarage.data$activity,avarage.data$subject.id),mean)
colnames(avarage.data)[1]="activity.group"
colnames(avarage.data)[2]="subject.group"


