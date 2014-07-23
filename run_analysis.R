
# mean and standard deviation columns (columns to keep)
meanAndStdCols <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)

# make data set for test
xtest <- read.table("test/X_test.txt")[,meanAndStdCols]
ytest <- read.table("test/y_test.txt")
stest <- read.table("test/subject_test.txt")

test <- cbind(ytest, xtest)
test <- cbind(stest, test)

# make data set for train
xtrain <- read.table("train/X_train.txt")[,meanAndStdCols]
ytrain <- read.table("train/y_train.txt")
strain <- read.table("train/subject_train.txt")

train <- cbind(ytrain, xtrain)
train <- cbind(strain, train)


# make one big data set by merging test and train
bigone <- rbind(test, train)
names(bigone) <- c("Subject.Id"
                  ,"Activity.Id"
                  ,"Time.Body.Accel.Mean.X"
                  ,"Time.Body.Accel.Mean.Y"
                  ,"Time.Body.Accel.Mean.Z"
                  ,"Time.Body.Accel.StdDev.X"
                  ,"Time.Body.Accel.StdDev.Y"
                  ,"Time.Body.Accel.StdDev.Z"
                  ,"Time.Gravity.Accel.Mean.X"
                  ,"Time.Gravity.Accel.Mean.Y"
                  ,"Time.Gravity.Accel.Mean.Z"
                  ,"Time.Gravity.Accel.StdDev.X"
                  ,"Time.Gravity.Accel.StdDev.Y"
                  ,"Time.Gravity.Accel.StdDev.Z"
                  ,"Time.Body.Accel.Jerk.Mean.X"
                  ,"Time.Body.Accel.Jerk.Mean.Y"
                  ,"Time.Body.Accel.Jerk.Mean.Z"
                  ,"Time.Body.Accel.Jerk.StdDev.X"
                  ,"Time.Body.Accel.Jerk.StdDev.Y"
                  ,"Time.Body.Accel.Jerk.StdDev.Z"
                  ,"Time.Body.Gyro.Mean.X"
                  ,"Time.Body.Gyro.Mean.Y"
                  ,"Time.Body.Gyro.Mean.Z"
                  ,"Time.Body.Gyro.StdDev.X"
                  ,"Time.Body.Gyro.StdDev.Y"
                  ,"Time.Body.Gyro.StdDev.Z"
                  ,"Time.Body.Gyro.Jerk.Mean.X"
                  ,"Time.Body.Gyro.Jerk.Mean.Y"
                  ,"Time.Body.Gyro.Jerk.Mean.Z"
                  ,"Time.Body.Gyro.Jerk.StdDev.X"
                  ,"Time.Body.Gyro.Jerk.StdDev.Y"
                  ,"Time.Body.Gyro.Jerk.StdDev.Z"
                  ,"Time.Body.Accel.Magnit.Mean"
                  ,"Time.Body.Accel.Magnit.StdDev"
                  ,"Time.Gravity.Accel.Magnit.Mean"
                  ,"Time.Gravity.Accel.Magnit.StdDev"
                  ,"Time.Body.Accel.Jerk.Magnit.Mean"
                  ,"Time.Body.Accel.Jerk.Magnit.StdDev"
                  ,"Time.Body.Gyro.Magnit.Mean"
                  ,"Time.Body.Gyro.Magnit.StdDev"
                  ,"Time.Body.Gyro.Jerk.Magnit.Mean"
                  ,"Time.Body.Gyro.Jerk.Magnit.StdDev"
                  ,"Freq.Body.Accel.Mean.X"
                  ,"Freq.Body.Accel.Mean.Y"
                  ,"Freq.Body.Accel.Mean.Z"
                  ,"Freq.Body.Accel.StdDev.X"
                  ,"Freq.Body.Accel.StdDev.Y"
                  ,"Freq.Body.Accel.StdDev.Z"
                  ,"Freq.Body.Accel.Jerk.Mean.X"
                  ,"Freq.Body.Accel.Jerk.Mean.Y"
                  ,"Freq.Body.Accel.Jerk.Mean.Z"
                  ,"Freq.Body.Accel.Jerk.StdDev.X"
                  ,"Freq.Body.Accel.Jerk.StdDev.Y"
                  ,"Freq.Body.Accel.Jerk.StdDev.Z"
                  ,"Freq.Body.Gyro.Mean.X"
                  ,"Freq.Body.Gyro.Mean.Y"
                  ,"Freq.Body.Gyro.Mean.Z"
                  ,"Freq.Body.Gyro.StdDev.X"
                  ,"Freq.Body.Gyro.StdDev.Y"
                  ,"Freq.Body.Gyro.StdDev.Z"
                  ,"Freq.Body.Accel.Magnit.Mean"
                  ,"Freq.Body.Accel.Magnit.StdDev"
                  ,"Freq.Body.Accel.Jerk.Magnit.Mean"
                  ,"Freq.Body.Accel.Jerk.Magnit.StdDev"
                  ,"Freq.Body.Gyro.Magnit.Mean"
                  ,"Freq.Body.Gyro.Magnit.StdDev"
                  ,"Freq.Body.Gyro.Jerk.Magnit.Mean"
                  ,"Freq.Body.Gyro.Jerk.Magnit.StdDev")

# Load activities and rename its columns
activities <- read.table("activity_labels.txt")
names(activities) <- c("Id", "Activity")

# Give activities descriptive labels
bigone <- merge(bigone, activities, by.x = "Activity.Id", by.y = "Id")
bigone$Activity = sapply(bigone$Activity, function(a) tolower(gsub("_", " ", a)))
bigone <- bigone[,!(names(bigone) %in% c("Id"))]

# Aggregate means by Activity and Subject
meansByActivityAndSubject <-aggregate(cbind(
                                    Time.Body.Accel.Mean.X
                                    ,Time.Body.Accel.Mean.Y
                                    ,Time.Body.Accel.Mean.Z
                                    ,Time.Body.Accel.StdDev.X
                                    ,Time.Body.Accel.StdDev.Y
                                    ,Time.Body.Accel.StdDev.Z
                                    ,Time.Gravity.Accel.Mean.X
                                    ,Time.Gravity.Accel.Mean.Y
                                    ,Time.Gravity.Accel.Mean.Z
                                    ,Time.Gravity.Accel.StdDev.X
                                    ,Time.Gravity.Accel.StdDev.Y
                                    ,Time.Gravity.Accel.StdDev.Z
                                    ,Time.Body.Accel.Jerk.Mean.X
                                    ,Time.Body.Accel.Jerk.Mean.Y
                                    ,Time.Body.Accel.Jerk.Mean.Z
                                    ,Time.Body.Accel.Jerk.StdDev.X
                                    ,Time.Body.Accel.Jerk.StdDev.Y
                                    ,Time.Body.Accel.Jerk.StdDev.Z
                                    ,Time.Body.Gyro.Mean.X
                                    ,Time.Body.Gyro.Mean.Y
                                    ,Time.Body.Gyro.Mean.Z
                                    ,Time.Body.Gyro.StdDev.X
                                    ,Time.Body.Gyro.StdDev.Y
                                    ,Time.Body.Gyro.StdDev.Z
                                    ,Time.Body.Gyro.Jerk.Mean.X
                                    ,Time.Body.Gyro.Jerk.Mean.Y
                                    ,Time.Body.Gyro.Jerk.Mean.Z
                                    ,Time.Body.Gyro.Jerk.StdDev.X
                                    ,Time.Body.Gyro.Jerk.StdDev.Y
                                    ,Time.Body.Gyro.Jerk.StdDev.Z
                                    ,Time.Body.Accel.Magnit.Mean
                                    ,Time.Body.Accel.Magnit.StdDev
                                    ,Time.Gravity.Accel.Magnit.Mean
                                    ,Time.Gravity.Accel.Magnit.StdDev
                                    ,Time.Body.Accel.Jerk.Magnit.Mean
                                    ,Time.Body.Accel.Jerk.Magnit.StdDev
                                    ,Time.Body.Gyro.Magnit.Mean
                                    ,Time.Body.Gyro.Magnit.StdDev
                                    ,Time.Body.Gyro.Jerk.Magnit.Mean
                                    ,Time.Body.Gyro.Jerk.Magnit.StdDev
                                    ,Freq.Body.Accel.Mean.X
                                    ,Freq.Body.Accel.Mean.Y
                                    ,Freq.Body.Accel.Mean.Z
                                    ,Freq.Body.Accel.StdDev.X
                                    ,Freq.Body.Accel.StdDev.Y
                                    ,Freq.Body.Accel.StdDev.Z
                                    ,Freq.Body.Accel.Jerk.Mean.X
                                    ,Freq.Body.Accel.Jerk.Mean.Y
                                    ,Freq.Body.Accel.Jerk.Mean.Z
                                    ,Freq.Body.Accel.Jerk.StdDev.X
                                    ,Freq.Body.Accel.Jerk.StdDev.Y
                                    ,Freq.Body.Accel.Jerk.StdDev.Z
                                    ,Freq.Body.Gyro.Mean.X
                                    ,Freq.Body.Gyro.Mean.Y
                                    ,Freq.Body.Gyro.Mean.Z
                                    ,Freq.Body.Gyro.StdDev.X
                                    ,Freq.Body.Gyro.StdDev.Y
                                    ,Freq.Body.Gyro.StdDev.Z
                                    ,Freq.Body.Accel.Magnit.Mean
                                    ,Freq.Body.Accel.Magnit.StdDev
                                    ,Freq.Body.Accel.Jerk.Magnit.Mean
                                    ,Freq.Body.Accel.Jerk.Magnit.StdDev
                                    ,Freq.Body.Gyro.Magnit.Mean
                                    ,Freq.Body.Gyro.Magnit.StdDev
                                    ,Freq.Body.Gyro.Jerk.Magnit.Mean
                                    ,Freq.Body.Gyro.Jerk.Magnit.StdDev
        ) ~ Activity + Subject.Id, data = bigone, FUN = mean)

# Write the data to an output file
write.table(meansByActivityAndSubject, file="tidyData.txt", row.names=FALSE, col.names = TRUE)

