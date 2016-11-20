
library(lubridate)

setwd("~/R")

## download the data zip file and unzips it
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, "dataset.zip")
unzip("dataset.zip")

##  reads the data file and chooses the records belonging to the specific dates
data <- "household_power_consumption.txt"
hhpc <- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".", na="?")
hhpc2 <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007") ,]

## Re-formats the date into 'date' format
hhpc2$newcol <- paste(hhpc2$Date, hhpc2$Time, sep=" ")
hhpc2$newcol <- dmy_hms(hhpc2$newcol)

## creates the graph

hhpc2$Sub_metering_1 <- as.numeric(hhpc2$Sub_metering_1)
hhpc2$Sub_metering_2 <- as.numeric(hhpc2$Sub_metering_2)
hhpc2$Sub_metering_3 <- as.numeric(hhpc2$Sub_metering_3)

plot(hhpc2$newcol, hhpc2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
        lines(hhpc2$newcol, hhpc2$Sub_metering_2, type="l", col="red")
        lines(hhpc2$newcol, hhpc2$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, bty="o", cex=0.75, col=c("black", "red", "blue"))

## saves the plot on the screen to a png file
dev.copy(png, file = "plot3.png", width = 480, height =480)

## closes the graphics device
dev.off()



