run_analysis<-function ()
{
  ## store directory names for quick access
  baseDir<-getwd()

  ## get the subject list
  subjectID1<-read.table(paste(baseDir,"subject_test.txt",sep = "/")) 
  subjectID2<-read.table(paste(baseDir,"subject_train.txt",sep = "/")) 
  subjectID<-rbind(subjectID1,subjectID2)
  
  ## get the action items
  actionID1<-read.table(paste(baseDir,"y_test.txt",sep = "/"))    
  actionID2<-read.table(paste(baseDir,"y_train.txt",sep = "/"))    
  actionID<-rbind(actionID1,actionID2)
  
  ## replace numeric values with level names in actionID
  b<-as.character(actionID[,1])
  b<-gsub("1","WALKING",b)
  b<-gsub("2","WALKING_UPSTAIRS",b)
  b<-gsub("3","WALKING_DOWNSTAIRS",b)
  b<-gsub("4","SITTING",b)
  b<-gsub("5","STANDING",b)
  b<-gsub("6","LAYING",b)
  
  
  featureTxt<-read.table(paste(baseDir,"features.txt",sep = "/"))
  
  measureData1<-read.table(paste(baseDir,"x_test.txt",sep = "/"))
  measureData2<-read.table(paste(baseDir,"x_train.txt",sep = "/"))
  measureData<-rbind(measureData1,measureData2)
  
  df<-data.frame(c(subjectID,data.frame(b),measureData))                 ## all columns of the data frame
  colnames(df)<-c("Subject ID","Action Type",as.character(featureTxt[,2]))
  
  ## keep only the first two columns of the initial data frame 
  ## and those having mean() or std() as a substring of their names
  i<-sort(c(1,2,grep("mean()",featureTxt[,2],fixed = TRUE)+2,grep("std()",featureTxt[,2],fixed = TRUE)+2))
  
  ## also remove the last 6 columns as they are used in specific vectorial calculations 
  dSub<-df[i[1:62]]
  colnames(dSub)<- sub("-Z"," on Z-axis"
                       ,sub("-Y"," on Y-axis"
                            ,sub("-X"," on X-axis"
                                 ,sub("-mean()"," Mean"
                                      ,sub("-std()"," Std. Dev."
                                           ,colnames(dSub)
                                           ,fixed = TRUE)
                                      ,fixed = TRUE)
                                 ,fixed = TRUE)
                            ,fixed = TRUE)
                       ,fixed = TRUE)
  colnames(dSub)<-sub("tBodyAcc","Body Acceleration",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tGravityAcc","Gravity Acceleration",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyAccJerk","Body Linear Acceleration Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyGyroJerk","Angular Velocity Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyAccMag ","Magnitude Of Body Acceleration",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tGravityAccMag ","Magnitude Of Gravity Acceleration",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyAccJerkMag ","Magnitude Of Body Linear Acceleration Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyGyroMag ","Magnitude Of Gyroscope 3-Axial Raw",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyGyroJerkMage","Magnitude Of Angular Velocity Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyAcc","FFT Of Accelerometer 3-Axial Raw",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyAccJerk","FFT Of Body Linear Acceleration Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyGyro","FFT Of Gyroscope 3-Axial Raw",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyAccMag","FFT Of Magnitude Of Body Acceleration",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyAccJerkMag","FFT Of Magnitude Of Body Linear Acceleration Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyGyroMag","FFT Of Magnitude Of Gyroscope 3-Axial Raw",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("fBodyGyroJerkMag","FFT Of Magnitude Of Angular Velocity Jerk",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("gravityMean","Gravity Acceleration Sample",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyAccMean","Body Acceleration Sample",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyAccJerkMean","Body Linear Acceleration Jerk Sample",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyGyroMean","Angular Velocity Sample",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyGyroJerkMean","Angular Velocity Jerk Sample",colnames(dSub), fixed = TRUE)
  colnames(dSub)<-sub("tBodyGyro","Gyroscope Acceleration",colnames(dSub), fixed = TRUE)
  
  dSub
}