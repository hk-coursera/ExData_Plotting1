source("read_data.R")

df <- read_data()

plot(df$datetime, df$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()