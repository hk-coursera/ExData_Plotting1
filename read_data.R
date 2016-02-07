
read_data <- function(filename="household_power_consumption.txt") {
  message("Estimated size of full data set is:")
  lines_count <- as.numeric(strsplit(system(paste0("wc -l ", filename), intern = TRUE), " ", fixed = TRUE)[[1]][1])
  head_size <- object.size(read.table("household_power_consumption.txt", nrow = 1000))
  message(format(lines_count / 1000 * head_size, units = "auto"))

  # It's about 300Mb for household_power_consumption.txt,
  # not a huge file, but I read only required dates anyway

  message("reading only 2007-02-01 and 2007-02-02 days...")
  library(sqldf)
  df <- read.csv.sql(filename, sep=";",
                     colClasses=c("Date", "character", rep("numeric", times=7)),
                     sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'",
                     eol = "\n")
  closeAllConnections() # brutal
  
  df$datetime <- strptime(paste0(as.Date(df$Date, '%d/%m/%Y'), ' ', df$Time), "%Y-%m-%d %H:%M:%S")
  
  df <- df[, !(names(df) %in% c('Date', 'Time'))]
  
  message("done")
  df
}