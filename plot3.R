############################################################
##You have to extract the data into your working directory##
############################################################

## Step 0 using the lubridate library
library(lubridate)
## Step 1 read the data into the elecdata (including doing all the adjustments)
elecdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses = c(rep("character", 2), rep("numeric", 7)))
## Step 2 creating a new data set for first & Second of Feb. 2007 only
mydata <- elecdata[elecdata$Date %in% c("1/2/2007","2/2/2007"),]
## Step 3 Creating the plot and putting the submetering data in different colos using the points command
par(bg=NA) ## set the background to transparent
plot(dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_1 ,type="n",xlab="",ylab ="Energy sub metering",cex.lab=1)
points (dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_1,type="l")
points(dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_2,col="red",type="l")
points(dmy(mydata$Date)+ hms(mydata$Time),mydata$Sub_metering_3,col="blue",type="l")
## Step 4 Creating the legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty =c(1,1),col=c("black","red","blue"),text.font=2,cex=0.8,pt.cex=1)
## Step 5 Copy my plot to a PNG file 480 * 480
dev.copy(png, file = "plot3.png",width=480,height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!