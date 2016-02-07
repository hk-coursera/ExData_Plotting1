source("read_data.R")

df <- read_data()

par(mfrow = c(2, 2))

# 1
plot(df$datetime, df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# 2
plot(df$datetime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3
with(df, {
  plot(datetime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub meterings")
  points(datetime, Sub_metering_2, col = "red", type = "l")
  points(datetime, Sub_metering_3, col = "blue", type = "l")
})
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

# 4
plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()