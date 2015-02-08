
source("./readData.R")

drawPlot4 <- function(hpcData) {
    
    new.mfrow <- c(2, 2)
    par(mfrow = new.mfrow)
    
    with( hpcData, {
        
        plot(
            Timestamp,
            Global.Active.Power,
            xlab = "datetime",
            type="l"
        )

        plot(
            Timestamp,
            Voltage,
            xlab = "datetime",
            type="l"
        )

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

        plot(
            Timestamp,
            Global.Reactive.Power,
            xlab = "datetime",
            type="l"
        )
    })
}

household.power.consumption <- readData()

png(file = "plot4.png", width = 480, height = 480)

drawPlot4(household.power.consumption)

dev.off()

