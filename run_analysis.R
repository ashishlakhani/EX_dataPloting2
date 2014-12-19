run_analysis <- function(){
  
  #Load up library
  library("dplyr")
  library("stringr")
  
  ##Read all the data 
  #Test dataset observations, activities and subjects 
  
  test_x <- read.csv("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)
  test_y <- read.csv("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)
  test_sub <- read.csv("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)
  
  #Training observations, activities and subjects    
  train_x <- read.csv("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)
  train_y <- read.csv("./UCI HAR Dataset/train/Y_train.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)  
  train_sub <- read.csv("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)
  
  #activity labels
  act <- read.csv("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE, sep = "" , header = FALSE)
  
  #colnames
  colnames(act) <- c("activity","label")
  
  #Merging columns for test & train dataset
  test_final <- cbind(test_sub,test_y,test_x)
  train_final <- cbind(train_sub,train_y,train_x)
  
  #Merging rows for test and train dataset
  dat_final <- rbind(test_final,train_final)
  
  col <- read.csv("./UCI_data/features.txt", sep="", stringsAsFactors = FALSE,header= FALSE)
  col_v <- c("subject","activity",make.unique(col$V2))
  
  #Cleaning up the variable names t = time, f= freq, BodyBody =Body, removing -()
  col_v <- mapply(gsub,"-mean\\(\\)","_mean",col_v)
  col_v <- mapply(gsub,"-std\\(\\)","_std",col_v)
  col_v <- mapply(gsub,"-","_",col_v)
  col_v <- mapply(gsub,"^t","time",col_v)
  col_v <- mapply(gsub,"^f","freq",col_v)  
  col_v <- str_replace(col_v, "BodyBody", "Body")
  
  #Assign variable names to columns
  colnames(dat_final) <- col_v
  
  #create table using dplyr
  ##Select rows containing mean and std deviation
  ##summarise columns by mean
  tbl_data_final <- tbl_df(dat_final) %>%
    select(contains("subject"),contains("activity"),contains("_mean"),contains("_std"),-contains("meanFreq")) %>%
    group_by(subject,activity) %>%     
    summarise_each(funs(mean)) %>%
    merge(act) %>%
    mutate(activity = label) %>%
    select(-label) %>%
    arrange(subject,activity)
    write.table(tbl_data_final,"tidy_data.txt",row.names = FALSE)
}