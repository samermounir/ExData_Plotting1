############################################################
##You have to extract the data into your working directory##
############################################################

## Step 0 using the lubridate library
library(lubridate)
## Step 1 read the data into the elecdata (including doing all the adjustments)
elecdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses = c(rep("character", 2), rep("numeric", 7)))
## Step 2 creating a new data set for first & Second of Feb. 2007 only
mydata <- elecdata[elecdata$Date %in% c("1/2/2007","2/2/2007"),]
## Step 3 Setting the parametee of the plot to have 4 graphs
par(bg=NA) ## set the background to transparent
par(mfrow= c(2,2))
par(ps=12) ## Changing the font size
## First plot
plot(dmy(mydata$Date)+ hms(mydata$Time),mydata$Global_active_power,type="l",xlab="",ylab ="Global Active Power",cex.lab=0.8)
## Second plot
plot(dmy(mydata$Date)+ hms(mydata$Time),mydata$Voltage,type="l",xlab="datetime",ylab ="Global Active Power",cex.lab=0.8)
## Third plot
plot(dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_1 ,type="n",xlab="",ylab ="Energy sub metering",cex.lab=0.8)
points (dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_1,type="l")
points(dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_2,col="red",type="l")
points(dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_3,col="blue",type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty =c(1,1),col=c("black","red","blue"),cex=0.5,pt.cex=1,bty = "n",trace=TRUE)
## Fourth plot
plot(dmy(mydata$Date)+ hms(mydata$Time),mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",cex.lab=0.8)
## Step 4 Copy my plot to a PNG file 480 * 480
dev.copy(png, file = "plot4.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!