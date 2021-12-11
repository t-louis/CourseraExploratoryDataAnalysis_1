##################################################################################
## R script to read the house electricity comsumption data. It will create
## a global variable call "CedaData" which will hold the extracted and processed
## dataset for 1st of Feb 2007 and 2nd of Feb 2007
##
## The R script would require following packages:
##  - tidyverse
##  - data.table
##  - lubridate
##
##################################################################################

## Load required library
library(tidyverse)
library(data.table)
library(lubridate)

## Initialize the global variable holding the data
CedaData <- NULL

##################################################################################
## Function to check if we have a valid tidy data which can be plotted.
## The function would check attributes of passed data.frame in term what is
## expected
##
##  Function:
##  --------
##  CedaIsValidData
##
##  Argument(s):
##  -----------
##  data  : data.frame
##
##  Return Value:
##  ------------
##  TRUE / FALSE
##
##################################################################################
CedaIsValidData <- function(data) {
  is.data.frame(data) &
  (sum(dim(data)==c(2880, 9)) == 2) &
  (all(
    names(data) %in%
    list(
      "Date", 
      "Time", 
      "Global_active_power", 
      "Global_reactive_power", 
      "Voltage", 
      "Global_intensity",
      "Sub_metering_1",
      "Sub_metering_2",
      "Sub_metering_3"
    )
  )
 )
}

##################################################################################
## Function to extract and filter the orignal dataset for the range of
## of date that we need for the plotting exercise.
##
##  Function:
##  --------
##  CedaGetData
##
##  Argument(s):
##  -----------
##  none
##
##  Return Value:
##  ------------
##  data.frame / NULL
##
##################################################################################
CedaGetData <- function() {
  
  ## We first check if we have a proper cache
  ## of the global variable if not we initialize it
  ## by read the original dataset
  if(CedaIsValidData(CedaData)) {
    data <- CedaData
  } else {
    
    ## Read the original data and process
    df <- fread("household_power_consumption.txt", header = TRUE)
    data <- df[df$Date %in% c("1/2/2007", "2/2/2007"), ]
    data <- data[, Time:=as.POSIXct(paste(data$Date, data$Time, sep = " "), format="%d/%m/%Y %H:%M:%OS", tz="Europe/Paris")]
    data <- data[, Date:=dmy(Date, tz="Europe/Paris")]
    data <- data[, Global_active_power:=as.numeric(Global_active_power)]
    data <- data[, Global_reactive_power:=as.numeric(Global_reactive_power)]
    data <- data[, Voltage:=as.numeric(Voltage)]
    data <- data[, Global_intensity:=as.numeric(Global_intensity)]
    data <- data[, Sub_metering_1:=as.numeric(Sub_metering_1)]
    data <- data[, Sub_metering_2:=as.numeric(Sub_metering_2)]
    data <- data[, Sub_metering_3:=as.numeric(Sub_metering_3)]
    
    ## Make the assignment to a global variable
    CedaData <<- data
    
    ## Clean-up the garbage collector since we read
    ## a large dataset and we do not need intermediary
    ## data
    gc()
  }
  
  ## Return the tidy data
  data
}

