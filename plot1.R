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

png("exdata_data_household_power_consumption/plot1.png", width=480, height=480)
hist(as.numeric(x$"Global_active_power"), col="red", xlab="Global Active Power (KW)", ylab="Frequency", main="Global Active Power")

dev.off()


