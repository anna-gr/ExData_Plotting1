## This script creates the file plot1.png

## Reading the data

colClasses <- c("character", "character", "numeric", 
                "numeric", "numeric", "numeric", 
                "numeric", "numeric", "numeric")
electric_power <- subset(read.table("household_power_consumption.txt", 
                                    header = TRUE, sep = ";", 
                                    colClasses = colClasses, na.strings = "?"), 
                         Date %in% c("1/2/2007", "2/2/2007"))

## Opening png graphic device and creating the plot

png(file = "plot1.png")
hist(electric_power$Global_active_power, col = "red", 
     xlab = "Global active power (kilowatts)", 
     main = "Global Active Power")
dev.off()

## Clearing memory
rm(electric_power)