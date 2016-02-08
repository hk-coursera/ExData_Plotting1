source("read_data.R")

df <- read_data()

dev.new()
par(mfrow = c(1, 1))

hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()