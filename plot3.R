power <- read.table(file = "household_power_consumption.txt", 
                    sep=";", 
                    header = T, 
                    na="?", 
                    colClasses = c("character",
                                   'character',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric',
                                   'numeric'))

power$dt <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

power$Date <- as.Date(power$Date, "%d/%m/%Y")

power <- subset(power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

png(filename="plot3.png",width=480, height=480)

plot(power$dt, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(power$dt, power$Sub_metering_2, type = "l", col = "red")

points(power$dt, power$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()