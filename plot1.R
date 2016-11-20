
library(sqldf)

setwd("~/R")

## download the data zip file and unzips it
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, "dataset.zip")
unzip("dataset.zip")

##  reads the data file and chooses the records belonging to the specific dates
data <- "household_power_consumption.txt"
hhpc <- read.table(data, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".", na="?")
hhpc2 <- hhpc[hhpc$Date %in% c("1/2/2007","2/2/2007") ,]

## par(mfrow=c(1,1))
hist(hhpc2$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## saves the plot on the screen to a png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)

## closes the graphics device
dev.off()



