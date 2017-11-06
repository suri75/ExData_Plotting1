#- plot1 graph
# - Read teh text data file
# - Get teh subset of data for 2 days 2007-02-01 and 2007-02-02
# - Generate  active power for the 2 days

powerdataFile <- "household_power_consumption.txt"
powerdata <- read.table(powerdataFile,header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")


subsetpowerdata <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")

datetime <- strptime(paste(subsetpowerdata$Date, subsetpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subsetpowerdata$Global_active_power)


png("plot2.png", height=480, width=480)

plot(datetime,globalActivePower,type="l", xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()
