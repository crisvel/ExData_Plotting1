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

## Q3 submetring plot3
png("plot3.png", width=480, height=480)

# Plot 3
plot(hhpcDT[, dateTime], hhpcDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(hhpcDT[, dateTime], hhpcDT[, Sub_metering_2],col="red")
lines(hhpcDT[, dateTime], hhpcDT[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()