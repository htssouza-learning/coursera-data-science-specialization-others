rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  # Rank can be a number or "best" or "worst"
  
  # read data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
  # check num and convert it to numeric
  if (num == "best") num <- 1
  if (num == "worst") num <- 0
  if (! is.numeric(num)) return(NA)
  
  # column/outcome check
  temp <- tolower(paste("Hospital.30.Day.Death..Mortality..Rates.from", gsub(" ", ".", outcome), sep ="."))
  outcomeColName <- names(data)[tolower(names(data)) == temp][1]
  outcomeColIndex <- match(outcomeColName, names(data))
    
  # check if found
  if (is.na(outcomeColIndex)) stop ("invalid outcome")
  
  # rename colname to make it easier to process
  colnames(data)[outcomeColIndex] <- "outcome"

  # get state names before removing NA
  states <- sort(unique(data$State))
  
  # remove "Not Available rows"
  data <- data[data$outcome != "Not Available",]
  
  # convert to numeric andget min value
  data$outcome <- as.numeric(data$outcome)
  
  # create the hospitals array that will be used to return
  hospitals <- c()
  
  # saves globalnum for loop
  globalnum <- num
  
  for(state in states) {

    # subset
    stateData <- data[data$State == state,] 
    
    # get by num/rank (num==0 -> worst/last)
    num <- globalnum
    if (num == 0) num <- nrow(stateData)
    if (num > nrow(stateData)) { 
      hospitals <- append (hospitals, NA)
      next
    }
    
    # sort and get the right value
    rates <- sort(stateData$outcome)
    rate <- rates[num]
    
    # get hospitals with that rate
    hospitalBeforeThisRateCount <- length(stateData[stateData$outcome < rate, 2])
    hospitalsWithThisRate <- stateData[stateData$outcome == rate, 2]
        
    # append the right one
    hospitals <- append(hospitals, sort(hospitalsWithThisRate)[num - hospitalBeforeThisRateCount])
    
  }
  
  data.frame(hospital = hospitals, state = states)
  
}
