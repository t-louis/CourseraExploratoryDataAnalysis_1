##################################################################################
## R script to reproduce plot4 and save it in PNG file plot4.png
##################################################################################
CedaPlot4 <- function() {
  data <- CedaGetData()
  xmin <- as.POSIXct("1/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%OS")
  xmax <- as.POSIXct("3/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%OS")
  par(mfcol=c(2,2))
  with(data, plot(Time, Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power"))
  axis.POSIXct(side=1, at=seq(xmin, xmax, by="day"), format="%a")
  with(data, plot(Time, Sub_metering_1, type="l", xaxt="n", xlab="", ylab="Energy sub metering"))
  lines(data$Time, data$Sub_metering_2, col="red")
  lines(data$Time, data$Sub_metering_3, col="blue")
  axis.POSIXct(side=1, at=seq(xmin, xmax, by="day"), format="%a")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
  with(data, plot(Time, Voltage, type="l", xaxt="n", xlab="datetime", ylab="Voltage"))
  axis.POSIXct(side=1, at=seq(xmin, xmax, by="day"), format="%a")
  with(data, plot(Time, Global_reactive_power, type="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power"))
  axis.POSIXct(side=1, at=seq(xmin, xmax, by="day"), format="%a")
  dev.copy(png, file="plot4.png")
  dev.off()
}
CedaPlot4()