##EXPLORATORY DATA ANALYSIS PROJECT1
##Getting data
if(!file.exists("pro1")){
  dir.create("pro1")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile ="pro1/hhpc.zip", method = "curl")
dateDnd <- date()
hhpc <- unzip("pro1/hhpc.zip")

#reading data
hhpcDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Transforming date to be filtered and graphed by time of day
hhpcDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates 
hhpcDT <- hhpcDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Q2 line Plot 2
plot(x = hhpcDT[, dateTime]
     , y = hhpcDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()