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
png(filename="plot1.png",width=480, height=480)
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()



