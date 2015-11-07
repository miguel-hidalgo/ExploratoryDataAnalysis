#
# Script Name.....: Plot1.R
#

#
# Read data file
AllData<-read.table("./household_power_consumption.txt", header=TRUE,na.strings = "?", sep=";")
#myDf$Date<-as.Date(myDf$Date)
# Load DPLRY library
library(dplyr)
# Load Lubridate
library(lubridate)
# Convert All Data Data Frame to Table
myDS<-tbl_df(AllData)
# Delete the AllData Frame 
rm(AllData)
# Set filters to compare in data set
myDate1<-paste0(day("2007-02-01"),"/",month("2007-02-01"),"/",year("2007-02-01"))
myDate2<-paste0(day("2007-02-02"),"/",month("2007-02-02"),"/",year("2007-02-02"))
# Filter the Data set with the interested dates
dat<-filter(myDS, Date==myDate1 | Date==myDate2)
# Plot Histogram
myGraph<-hist(dat$Global_active_power)
# Open a PNG file
png(filename = "./plot1.png", width=480, height=480)
#Plot the Histogram with the specific details to the file
plot(myGraph, col="red",  main="Global Active Power", xlab="Global Active Power (Kilowatts)")
# Close the device (File)
dev.off()

# End of ScriptEnter file contents here
