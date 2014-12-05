############################################################
##You have to extract the data into your working directory##
############################################################

## Step 0 using the lubridate library
library(lubridate)
## Step 1 read the data into the elecdata including doing all the adjustments
## like reading the header , seperator ";", removing the rows containing n"?"
elecdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses = c(rep("character", 2), rep("numeric", 7)))
## Step 2 creating a new data set for first & Second of Feb. 2007 only
mydata <- elecdata[elecdata$Date %in% c("1/2/2007","2/2/2007"),]
## Step 3 Creating the plot DateTime -> dmy(mydata$Date)+ hms(mydata$Time) versus Global_active_power
par(bg=NA) ## set the background to transparent
plot(dmy(mydata$Date)+ hms(mydata$Time),mydata$Global_active_power,type="l",xlab="",ylab ="Global Active Power (KilloWatts)")
## Step 4 Copy my plot to a PNG file 480 * 480
dev.copy(png, file = "plot2.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
