
best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  # read data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # check state
  stateData <- data[data$State == state,]
  if (nrow(stateData) == 0) stop("invalid state")
    
  # column/outcome check
  temp <- tolower(paste("Hospital.30.Day.Death..Mortality..Rates.from", gsub(" ", ".", outcome), sep ="."))
  outcomeColName <- names(stateData)[tolower(names(stateData)) == temp][1]
  outcomeColIndex <- match(outcomeColName, names(stateData))
  
  # check if found
  if (is.na(outcomeColIndex)) stop ("invalid outcome")
  
  # rename colname to make it easier to process
  colnames(stateData)[outcomeColIndex] <- "outcome"
  
  # remove "Not Available rows"
  stateData <- stateData[stateData$outcome != "Not Available",]

  # convert to numeric andget min value
  stateData$outcome <- as.numeric(stateData$outcome)
  minRate <- min(stateData$outcome)
  
  # get hospitals with that rate
  hospitals <- stateData[stateData$outcome == minRate, 2]
  
  # return the first one
  sort(hospitals)[1]  
}

