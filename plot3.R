## Author: Ajay Aggarwal
## Date: 04/19/2019
## This Course: Exploratory Data Analysis

## overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 
## task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

setwd("D:/Work/mystuff/Education/DataScience/Exploratory Data Analysis")

destfile="exdata_data_household_power_consumption/household_power_consumption.txt"    

if(!file.exists(destfile)){
  
  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
  download.file(url = URL, destfile = "exdata_data_household_power_consumption.zip") 
  unzip("exdata_data_household_power_consumption.zip")
  
}

setwd("D:/Work/mystuff/Education/DataScience/Exploratory Data Analysis")

library(dplyr)

x <- filter(tbl_df(read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";")), (Date=="1/2/2007"|Date=="2/2/2007"))

my_datetime <- strptime(paste(x$Date, x$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
x2 <- cbind(x,my_datetime)

png("exdata_data_household_power_consumption/plot3.png", width=480, height=480)

plot(x2$my_datetime, as.numeric(x2$"Sub_metering_1") , type="l", ylab="Energy Submetering", xlab="")
lines(x2$my_datetime, x2$"Sub_metering_2", type="l", col="red")
lines(x2$my_datetime, x2$"Sub_metering_3", type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()


