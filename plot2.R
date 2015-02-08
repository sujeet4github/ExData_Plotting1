
source("./readData.R")

drawPlot2 <- function(hpcData) {
    
    with( household.power.consumption,    {
    
        plot(
            Timestamp,
            Global.Active.Power,
            type="l"
        )
    })
}

household.power.consumption <- readData()

# save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(file = "plot2.png", width = 480, height = 480)

drawPlot2(household.power.consumption)

dev.off()