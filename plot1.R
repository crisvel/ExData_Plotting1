##EXPLORATORY DATA ANALYSIS PROJECT1
##Getting data
if(!file.exists("pro1")){
  dir.create("pro1")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile ="pro1/hhpc.zip", method = "curl")
dateDnd <- date()
hhpc <- unzip("pro1/hhpc.zip")

#reading data
library(data.table)
hhpcDT <-data.table::fread(hhpc, na.strings = "?", )

#setting up date 
hhpcDT [, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#filter dates
hhpcDT <- hhpcDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Q1 First plot to a png file
png("plot1.png", width=480, height=480)

hist(hhpcDT$Global_active_power, freq = 10, col = "red", main="Global Active Power",
xlab="Global Active Power(kilowatts)")

dev.off()

