# 
# Script for generating plot 3
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
png("plot3.png", width=480, height=480, units="px")
Sys.setlocale("LC_TIME", "us") 
plot(data$DateTime, data$Sub_metering_1, type="n", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') , 
       col=c('black', 'red', 'blue'), lty=1)
dev.off()


