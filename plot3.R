source("read_data.R")

df <- read_data()

dev.new()
par(mfrow = c(1, 1))

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
       text.width = strwidth("Sub_metering_1")*dev.size(units="px")[1]/480,
       lwd = 4
)

dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()