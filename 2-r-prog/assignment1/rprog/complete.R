complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # vector of nobs
  nobs <- c()
  
  for(i in id) {    
    
    # format file name
    if (i < 10) {
      fileName <- paste("00", i, sep ="")
    } else if (i < 100 ) {
      fileName <- paste("0", i, sep ="")
    } else {
      fileName <- paste("", i, sep ="")
    }
    fullName = paste(directory, "/", fileName, ".csv", sep = "")
    
    # read data and adds it to main vector (v)
    data <- read.csv(fullName)
    
    # read columns
    sulfates <- data[,2]
    nitrates <- data[,3]
    valid <- complete.cases(sulfates, nitrates)
    nobs <- c(nobs, length(valid[valid]))
      
  }
  
  # build the data frame and returns it
  data.frame(id = id, nobs = nobs)
}

