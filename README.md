# Course-3-Week-4-SubmissionThis R function called “run_analysis.R” is a transformation and data cleaning 

of the measurements performed by
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset and its derivations are distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

The initial data features are described in this folder's documents:
a) README.txt		- an initial description of the experiment
b) features_info.txt	- describes what initial measurements have been performed with the accelerometer and the gyroscope on a group of 30 subjects (identified by numbers from 1 to 30) who executed 6 types of actions during the experiment
c) features.txt		- is the name list of 561 direct and derived measurements that are provided in the initial data set
d) activity_labels.txt	- is the name list of the 6 types of actions performed by subjects

As the initial group of 30 persons has been divided into two subgroups, their measurements’ data has been recorded separately and stored in two different sub-folder called “test” and “train”.
Each of the subfolders contains: 

e) subject_test.txt, respectively subject_train.txt	- contain the identities of the experiment participants for each of the experiment measurements; there are 2947, respectively 7352, rows in these files, and one column
f) y_test.txt, respectively y_train.txt			- contain the identities of the types of activities for each of the experiment measurements; there are 2947, respectively 7352, rows in these files, and one column
g) x_test.txt, respectively x_train.txt			- contain measurement data for the 561 direct and derived columns described in c) “features.txt” that have been recorded in 2947, respectively 7352, rows (records)

The function “run_analysis.R” must be copied altogether with the data in the existing folder/sub-folder structure and executed in the root copy folder.

Its purpose is to clean and aggregate the above initial data by:
a)	Putting together test and train data and identify each record (measurement) with the corresponding Subject ID and its type of action
b)	Keeping only the columns that have a meaningful average or a standard deviation as a measure
c)	Renaming these column headers in a friendlier way

The resulting columns of function “run_analysis.R” are described in the CodeBook.txt.
