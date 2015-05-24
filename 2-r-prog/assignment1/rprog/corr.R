corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  # vector of correlations
  cors <- c()
  
  for(i in 1:332) {    
    
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
    validN <- length(valid[valid])
    
    # if valid monitor, add it to the vector
    if (validN >= threshold) {
      cors <- c(cors, cor(sulfates[valid], nitrates[valid]))
    }
  }
  
  # return the result vector
  cors
}

