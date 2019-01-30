##Read the Data
data <- data.table::fread("household_power_consumption.txt", header = T, na.strings = "?", sep =";", check.names=F, stringsAsFactors=F, quote='\"' )
##Take the subset
data_subset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
##Format the Date
data_subset$Date <- as.Date(data$Date, format = "%d/%m/%y")
##Open the plot
png("plot1.png", width=480, height=480)
##Create the Histogram
hist(data_subset$Global_active_power, main= "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##Close Device
dev.off()