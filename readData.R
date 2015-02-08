readData <- function () {
    
    zipFilePath <- "./data/exdata-data-household_power_consumption.zip"
    fileName <- "household_power_consumption.txt"
    
    fileConn <- unz(zipFilePath, filename = fileName)

    # Note the values of nrows and skip were calculated by reading and observing the data set
    # also noted there are no ?'s in this set of data, so no need to worry about that in this specific case
    #
    household.power.consumption <-
        read.table(fileConn,
                   header = FALSE,
                   sep = ";",
                   col.names  = c("Date",      "Time",      "Global Active Power", "Global Reactive Power", "Voltage", "Global Intensity", "Sub Metering 1", "Sub Metering 2", "Sub Metering 3"),
                   colClasses = c("character", "character", "numeric",             "numeric",               "numeric", "numeric",          "numeric",        "numeric",        "numeric"),
                   skip = 66637,
                   nrows = 2880,
                   na.strings="?"
                   )
    # No need for na.omit, no NA's in the DF

    # Unified timestamp
    #
    household.power.consumption$Timestamp <- strptime(paste(household.power.consumption$Date,
                                                            household.power.consumption$Time,
                                                            sep = "-"),
                                                      format="%d/%m/%Y-%H:%M:%S")
    
    household.power.consumption
}
