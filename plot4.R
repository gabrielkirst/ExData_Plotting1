plot4 <- function() {
  fileInfo <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  
  fileInfo$Time <- strptime(paste(fileInfo$Date, fileInfo$Time), "%d/%m/%Y %H:%M:%S")
  fileInfo$Date <- as.Date(fileInfo$Date, "%d/%m/%Y")
  
  dateFilter <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  fileInfo <- subset(fileInfo, Date %in% dateFilter)
  
  png("plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  
  # Chart1
  plot(fileInfo$Time, fileInfo$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power")
  
  # Chart 2
  plot(fileInfo$Time, fileInfo$Voltage, type="l",
       xlab="datetime", ylab="Voltage")
  
  # Chart 3
  plot(fileInfo$Time, fileInfo$Sub_metering_1, type="l", col="black",
       xlab="", ylab="Energy sub metering")
  lines(fileInfo$Time, fileInfo$Sub_metering_2, col="red")
  lines(fileInfo$Time, fileInfo$Sub_metering_3, col="blue")
  legend("topright",
         col=c("black", "red", "blue"),
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=1,
         box.lwd=0)
  
  # Chart 4
  plot(fileInfo$Time, fileInfo$Global_reactive_power, type="n",
       xlab="datetime", ylab="Global_reactive_power")
  lines(fileInfo$Time, fileInfo$Global_reactive_power)
  
  dev.off()
  
}