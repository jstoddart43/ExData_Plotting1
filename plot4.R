power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerFeb <- power[(power$Date == '2007-02-01' | power$Date == '2007-02-02'),]

png(file = "./plot4.png")
par(mfcol= c(2,2))

plot(powerFeb$timestamp,powerFeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(powerFeb$timestamp, powerFeb$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(powerFeb$timestamp, powerFeb$Sub_metering_2, col = "red")
lines(powerFeb$timestamp, powerFeb$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

powerFeb$Voltage <- as.numeric(as.character(powerFeb$Voltage))
plot(powerFeb$timestamp,powerFeb$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

powerFeb$Global_reactive_power <- as.numeric(as.character(powerFeb$Global_reactive_power))
plot(powerFeb$timestamp,powerFeb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
