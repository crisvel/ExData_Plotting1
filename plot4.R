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

#Q4 4plots panel
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(hhpcDT[, dateTime], hhpcDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(hhpcDT[, dateTime],hhpcDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(hhpcDT[, dateTime], hhpcDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(hhpcDT[, dateTime], hhpcDT[, Sub_metering_2], col="red")
lines(hhpcDT[, dateTime], hhpcDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(hhpcDT[, dateTime], hhpcDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()