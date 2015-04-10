# 
# Script for generating plot 2
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
png("plot2.png", width=480, height=480, units="px")
Sys.setlocale("LC_TIME", "us")  #in order to get english weekdays
plot(data$DateTime, data$Global_active_power,type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


