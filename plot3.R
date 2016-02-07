source("read_data.R")

df <- read_data()

with(df, {
     plot(datetime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub meterings")
     points(datetime, Sub_metering_2, col = "red", type = "l")
     points(datetime, Sub_metering_3, col = "blue", type = "l")
})

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.copy(png,'plot3.png', width = 480, height = 480)
dev.off()