## This script creates the file plot2.png

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

png(file = "plot2.png")
with(electric_power, plot(DateTime, Global_active_power, type = "l", 
                          xlab = "", ylab = "Global active power (kilowatts)"))
dev.off()

## Clearing memory
rm(electric_power)