
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
plot(hhpc2$newcol, hhpc2$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

## saves the plot on the screen to a png file
dev.copy(png, file = "plot2.png", width = 480, height =480)

## closes the graphics device
dev.off()



