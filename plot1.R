

source("./readData.R")

drawHist <- function(hpcData) {
    
    hist(hpcData$Global.Active.Power,
         col = "Red",
         labels = FALSE,
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)")
}

household.power.consumption <- readData()

# save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(file = "plot1.png", width = 480, height = 480)

drawHist(household.power.consumption)

dev.off()