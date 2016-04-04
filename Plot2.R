data_all <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", check.names = FALSE, stringsAsFactors = FALSE, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data for the given dats

data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting dates and times to timestamps

timestamp <- paste(as.Date(data$Date), data$Time)
data$timestamp <- as.POSIXct(timestamp)

## Plot 2

plot(data$timestamp, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", mar = c(4, 4, 2, 2))

## Saving to file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
