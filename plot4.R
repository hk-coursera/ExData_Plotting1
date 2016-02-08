source("read_data.R")

df <- read_data()

dev.new()
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
# Result of strwidth depends on the size of current plotting device and
# by default, R assumes that your screen has 72 dpi.
# Because my laptop screen has ~96 dpi, I have to correct text.width a little.
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n", # too little space for this border on 480x480 image
       text.width = strwidth("Sub_metering_1")*dev.size(units="px")[1]/480,
       lwd = 4
)

# 4
plot(df$datetime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()