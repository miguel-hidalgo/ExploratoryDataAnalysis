#
# Script Name.....: Plot2.R
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
# Open a PNG file
png(filename = "./plot2.png", width=480, height=480)
#Plot the data with the specific details to the file
plot(dat$Global_active_power, type="s", xaxt="n", ylab="Global Active Power (Kilowatts)")# Close the device (File)
# Create array with the 3 days of the week from the data
dow<-c("Thu","Fri", "Sat")
axis(1, at=1 , labels=dow[1] )
axis(1, at=nrow(dat)/2 , labels=dow[2] )
axis(1, at=nrow(dat) , labels=dow[3] )
dev.off()

#end of scriptEnter file contents here
