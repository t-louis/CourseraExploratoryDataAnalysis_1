##################################################################################
## R script to reproduce plot2 and save it in PNG file plot2.png
##################################################################################
CedaPlot2 <- function() {
  data <- CedaGetData()
  with(data, plot(Time, Global_active_power, type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)"))
  xmin <- as.POSIXct("1/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%OS")
  xmax <- as.POSIXct("3/2/2007 00:00:00", format="%d/%m/%Y %H:%M:%OS")
  axis.POSIXct(side=1, at=seq(xmin, xmax, by="day"), format="%a")
  dev.copy(png, file="plot2.png")
  dev.off()
}
CedaPlot2()