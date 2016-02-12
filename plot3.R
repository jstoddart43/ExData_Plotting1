power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerFeb <- power[(power$Date == '2007-02-01' | power$Date == '2007-02-02'),]

powerFeb$Sub_metering_1 <- as.numeric(as.character(powerFeb$Sub_metering_1))
powerFeb$Sub_metering_2 <- as.numeric(as.character(powerFeb$Sub_metering_2))
powerFeb$Sub_metering_3 <- as.numeric(as.character(powerFeb$Sub_metering_3))


png(file = "./plot3.png")
plot(powerFeb$timestamp, powerFeb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(powerFeb$timestamp, powerFeb$Sub_metering_2, col = "red")

lines(powerFeb$timestamp, powerFeb$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
dev.off()
