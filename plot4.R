#- plot1 graph
# - Read teh text data file
# - Get teh subset of data for 2 days 2007-02-01 and 2007-02-02
# - Generate  plot with 4 graphs as shown in the readme file

powerdataFile <- "household_power_consumption.txt"
powerdata <- read.table(powerdataFile,header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


subsetpowerdata <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

datetime <- strptime(paste(subsetpowerdata$Date, subsetpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subsetpowerdata$Global_active_power)
globalReactivePower <- as.numeric(subsetpowerdata$Global_reactive_power)
voltage <- as.numeric(subsetpowerdata$Voltage)


subMetering1 <- as.numeric(subsetpowerdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetpowerdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetpowerdata$Sub_metering_3)

png("plot4.png", height=480,width = 480)


par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

 dev.off()