##Read the Data
data <- data.table::fread("household_power_consumption.txt", header = T, na.strings = "?", sep =";", check.names=F, stringsAsFactors=F, quote='\"' )
##Take the subset
data_subset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
##Format date
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##Format global active power
globalactivepower <- as.numeric(data_subset$Global_active_power)
##Open the plot
png("plot2.png", width=480, height=480)
##Create the plot
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##Close Device
dev.off()