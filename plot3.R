plot3 <- function() {
  fileInfo <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  
  fileInfo$Time <- strptime(paste(fileInfo$Date, fileInfo$Time), "%d/%m/%Y %H:%M:%S")
  fileInfo$Date <- as.Date(fileInfo$Date, "%d/%m/%Y")
  
  dateFilter <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  fileInfo <- subset(fileInfo, Date %in% dateFilter)
  
  png("plot3.png", width=480, height=480)
  
  plot(fileInfo$Time, fileInfo$Sub_metering_1, type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(fileInfo$Time, fileInfo$Sub_metering_2, col="red")
  lines(fileInfo$Time, fileInfo$Sub_metering_3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1)
  
  dev.off()
}