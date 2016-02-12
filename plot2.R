power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerFeb <- power[(power$Date == '2007-02-01' | power$Date == '2007-02-02'),]

powerFeb$Global_active_power <- as.numeric(as.character(powerFeb$Global_active_power))

powerFeb <- transform(powerFeb, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(file = "./plot2.png")
plot(powerFeb$timestamp,powerFeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
