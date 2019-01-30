##Read the Data
data <- data.table::fread("household_power_consumption.txt", header = T, na.strings = "?", sep =";", check.names=F, stringsAsFactors=F, quote='\"' )
##Take the subset
data_subset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
##Format date
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Format global active power
globalactivepower <- as.numeric(data_subset$Global_active_power)
##Format sub meter 1
sub_metering1 <- as.numeric(data_subset$Sub_metering_1)
##Format sub meter 2
sub_metering2 <- as.numeric(data_subset$Sub_metering_2)
##Format sub meter 3
sub_metering3 <- as.numeric(data_subset$Sub_metering_3)
##Format voltage
voltage <- as.numeric(data_subset$Voltage)
##Format global reactive power
globalreactivepower <- as.numeric(data_subset$Global_reactive_power)
##Open the plot
png("plot4.png", width=480, height=480)
##Split plot
par(mfrow = c(2,2))
##Plot 1
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
##Plot 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
##Plot 3
plot(datetime, sub_metering1, type="l", xlab = "", ylab = "Energy Submetering")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
##Plot 4
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
##Close Device
dev.off()