## This script creates the file plot3.png

library(lubridate)

## Reading the data

colClasses <- c("character", "character", "numeric", 
                "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric")
electric_power <- subset(read.table("household_power_consumption.txt", 
                                    header = TRUE, sep = ";", 
                                    colClasses = colClasses, na.strings = "?"), 
                         Date %in% c("1/2/2007", "2/2/2007"))

## Creating formatted Date/Time column
DateTime <- dmy_hms(paste(electric_power$Date, electric_power$Time))
electric_power <- cbind(DateTime, electric_power)

## Opening png graphic device and creating the plot

png(file = "plot3.png")
with(electric_power, plot(DateTime, Sub_metering_1, type = "l", 
                          xlab = "", ylab = "Energy sub metering"))
with(electric_power, lines(DateTime, Sub_metering_2, col = "red"))
with(electric_power, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## Clearing memory
rm(electric_power)