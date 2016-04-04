data_all <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data for the given dats

data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting dates and times to timestamps

timestamp <- paste(as.Date(data$Date), data$Time)
data$timestamp <- as.POSIXct(timestamp)

## Plot 3

with( data, {plot(Sub_metering_1~timestamp, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
  lines(Sub_metering_2~timestamp, col = 'Red') 
  lines(Sub_metering_3~timestamp, col = 'Blue')})

legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
