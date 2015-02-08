
source("./readData.R")

drawPlot3 <- function(hpcData) {
    
    with( hpcData,    {
        
        plot(
            Timestamp,
            Sub.Metering.1,
            ylab = "Energy sub metering",
            type="n",
            main = "Test"
        )
        
        lines(Timestamp, Sub.Metering.1, col = "black")
        
        lines(Timestamp, Sub.Metering.2, col = "red")
        
        lines(Timestamp, Sub.Metering.3, col = "blue")
        
        legend("topright", lty = 1,
            col =    c("black",          "red",            "blue"),
            legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
    })
}

household.power.consumption <- readData()

png(file = "plot3.png", width = 480, height = 480)

drawPlot3(household.power.consumption)

dev.off()
