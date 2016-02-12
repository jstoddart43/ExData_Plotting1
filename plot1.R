power <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

power$Date <- as.Date(power$Date, format="%d/%m/%Y")

powerFeb <- power[(power$Date == '2007-02-01' | power$Date == '2007-02-02'),]

powerFeb$Global_active_power <- as.numeric(as.character(powerFeb$Global_active_power))

png(file = "./plot1.png")
hist(powerFeb$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
