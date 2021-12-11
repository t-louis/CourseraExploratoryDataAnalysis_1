##################################################################################
## R script to reproduce plot3 and save it in PNG file plot3.png
##################################################################################
CedaPlot3 <- function() {
  data <- CedaGetData()
  xmin <- as.POSIXct("1/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%OS")
  xmax <- as.POSIXct("3/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%OS")
  with(data, plot(Time, Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering"))
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  axis.POSIXct(side=1, at=seq(xmin, xmax, by="day"), format="%a")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  dev.copy(png, file="plot3.png")
  dev.off()
}
CedaPlot3()