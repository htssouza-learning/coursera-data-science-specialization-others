pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # main vector
  v <- c()
  
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
    
    if (pollutant == "sulfate") {
      v <- c(v, data[,2])
    } else if (pollutant == "nitrate") {
      v <- c(v, data[,3])
    }  
  }
  
  # remove NA
  valid <- !is.na(v)
  v <- v[valid]
  
  # return mean
  mean(v)  
}