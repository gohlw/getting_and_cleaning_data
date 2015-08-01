# Download the needed zip, and unzip into a folder named 'UCI HAR Dataset'
dir.create('UCI HAR Dataset', showWarnings=FALSE)
dataZip <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(dataZip, 'UCI-HAR-dataset.zip', mode='wb')
unzip('./UCI-HAR-dataset.zip')

# Read X's train and test data, and then merge them
# this is basically all the "set" combined
train_x <- read.table('./UCI HAR Dataset/train/X_train.txt')
test_x <- read.table('./UCI HAR Dataset/test/X_test.txt')
x <- rbind(train_x, test_x)

# Read Y's train and test, merge them,
# this is basically all the "activity" combined
train_y <- read.table('./UCI HAR Dataset/train/y_train.txt')
test_y <- read.table('./UCI HAR Dataset/test/y_test.txt')
y <- rbind(train_y, test_y)

# Read subject's train and test, merge them
# this is basically all the "subject" combine
train_subject <- read.table('./UCI HAR Dataset/train/subject_train.txt')
test_subject <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subject <- rbind(train_subject, test_subject)

# read the features, which happens to be the "table header" fro all the "set"
features <- read.table('./UCI HAR Dataset/features.txt')
colnames(x) <- features[,2] #second column is the names

# assign a header to "subject"
colnames(subject) <- c("subject")

# assign a header to "activity"
colnames(y) <- c("activity")

# get all the table headers that contains "mean" and "std"
headers_mean_std <- grep("mean\\(\\)|std\\(\\)",features[,2],value=TRUE)
# subset the data to get only "mean" or "std" column
data_mean_std<- subset(x,select=headers_mean_std)

# column bind "subject" and "activity"
combined_subject_activity <- cbind(subject, y)
# column bind "subject"+"activity" above to the mean and std only "set"
combined_subject_activity_set <- cbind(combined_subject_activity, data_mean_std)

# apply appropriate, easy to read name to the combined data
names(combined_subject_activity_set)<-gsub("std()", "SD", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("mean()", "MEAN", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("^t", "time", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("^f", "frequency", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("Acc", "Accelerometer", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("Gyro", "Gyroscope", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("Mag", "Magnitude", names(combined_subject_activity_set))
names(combined_subject_activity_set)<-gsub("BodyBody", "Body", names(combined_subject_activity_set))

# creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject. 
average_data <- aggregate(x=combined_subject_activity_set, by=list(activities=combined_subject_activity_set$activity, subj=combined_subject_activity_set$subject), FUN=mean)
average_data <- average_data[, !(colnames(average_data) %in% c("subject", "activity"))]
write.table(average_data, 'average.txt', row.names = F)

