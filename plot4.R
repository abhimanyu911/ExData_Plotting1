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

png(filename="plot4.png",width=480, height=480)

par(mfrow=c(2,2))

par(mar=c(4,4,4,4))

plot(power$dt, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(power$dt, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(power$dt, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(power$dt, power$Sub_metering_2, type = "l", col = "red")

points(power$dt, power$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.8)

plot(power$dt, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()