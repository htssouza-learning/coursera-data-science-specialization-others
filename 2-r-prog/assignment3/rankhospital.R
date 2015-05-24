rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  # Rank can be a number or "best" or "worst"
    
  # read data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # check state
  stateData <- data[data$State == state,]
  if (nrow(stateData) == 0) stop("invalid state")
  
  # check num and convert it to numeric
  if (num == "best") num <- 1
  if (num == "worst") num <- 0
  if (! is.numeric(num)) return(NA)
    
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
  
  # get by num/rank (num==0 -> worst/last)
  if (num == 0) num <- nrow(stateData)
  if (num > nrow(stateData)) return (NA)
  
  # sort and get the right value
  rates <- sort(stateData$outcome)
  rate <- rates[num]
        
  # get hospitals with that rate
  hospitalBeforeThisRateCount <- length(stateData[stateData$outcome < rate, 2])
  hospitalsWithThisRate <- stateData[stateData$outcome == rate, 2]
  
  #print(hospitalBeforeThisRateCount)
  #print(hospitalsWithThisRate)
  
  # return the first one
  sort(hospitalsWithThisRate)[num - hospitalBeforeThisRateCount]  
    
}

rankhospital("TX", "heart failure", 4)

