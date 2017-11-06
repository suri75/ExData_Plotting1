
  #- plot1 graph
  # - Read teh text data file
  # - Get teh subset of data for 2 days 2007-02-01 and 2007-02-02
  # - Generate histogram of active power
  
  powerdataFile <- "household_power_consumption.txt"
  powerdata <- read.table(powerdataFile,header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
  
  
  subsetpowerdata <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007")
  
  globalActivePower <- as.numeric(subsetpowerdata$Global_active_power)
  
  
  png("plot1.png", height=480, width=480)
  
 hist(globalActivePower,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
 
dev.off()


