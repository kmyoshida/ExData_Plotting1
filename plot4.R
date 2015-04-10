# 
# Script for generating plot 4
#

# Load the data
# 2 calls to read.table to get the columns names AND skip some rows
datafile <- "household_power_consumption.txt"
header <- read.table(datafile, sep=";", header=FALSE, na.strings="?",
                     nrows=1, stringsAsFactors=FALSE)
data <- read.table(datafile, sep=";", header=FALSE, na.strings="?",
                   skip=66637, nrows=2880, stringsAsFactors=FALSE)
colnames(data) <- unlist(header)

# Add a DateTime field 
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          "%d/%m/%Y %H:%M:%S")

# Generate the plot as png file
png("plot4.png", width=480, height=480, units="px")
Sys.setlocale("LC_TIME", "us") 
par(mfrow = c(2, 2), mar = c(4, 4, 4, 2))

#1
plot(data$DateTime, data$Global_active_power,type="l", xlab="", ylab="Global Active Power")

#2
plot(data$DateTime, data$Voltage,type="l", xlab="datetime", ylab="Voltage")

#3
plot(data$DateTime, data$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , col=c('black', 'red', 'blue'), lty=1, bty="n")

#4
plot(data$DateTime, data$Global_active_power,type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


