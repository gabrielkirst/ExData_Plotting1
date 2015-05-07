plot2 <- function() {
  fileInfo <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  
  fileInfo$Time <- strptime(paste(fileInfo$Date, fileInfo$Time), "%d/%m/%Y %H:%M:%S")
  fileInfo$Date <- as.Date(fileInfo$Date, "%d/%m/%Y")
  
  dateFilter <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  fileInfo <- subset(fileInfo, Date %in% dateFilter)
  
  png("plot2.png", width=480, height=480)
  
  plot(fileInfo$Time, fileInfo$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
}
