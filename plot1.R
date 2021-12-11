##################################################################################
## R script to reproduce plot1 and save it in PNG file plot1.png
##################################################################################
CedaPlot1 <- function() {
  data <- CedaGetData()
  hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.copy(png, file="plot1.png")
  dev.off()
}
CedaPlot1()

