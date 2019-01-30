##Read the Data
data <- data.table::fread("household_power_consumption.txt", header = T, na.strings = "?", sep =";", check.names=F, stringsAsFactors=F, quote='\"' )
##Take the subset
data_subset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
##Format date
datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Format sub meter 1
sub_metering1 <- as.numeric(data_subset$Sub_metering_1)
##Format sub meter 2
sub_metering2 <- as.numeric(data_subset$Sub_metering_2)
##Format sub meter 3
sub_metering3 <- as.numeric(data_subset$Sub_metering_3)
##Open the plot
png("plot3.png", width=480, height=480)
##Plot sm1
plot(datetime, sub_metering1, type="l", xlab = "", ylab = "Energy Submetering")
##Plot sm2
lines(datetime, sub_metering2, type="l", col="red")
##Plot sm3
lines(datetime, sub_metering3, type="l", col="blue")
##Add legend to top right
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
##Close Device
dev.off()