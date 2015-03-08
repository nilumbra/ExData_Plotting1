##Step 1 read the file 
d <-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
##Step 2 subsetting
data<-d[(d$Date=="1/2/2007" | d$Date=="2/2/2007" ),]
## change time-date format
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

##plot3
##create a plot without displaying data
plot3<-function(){
plot(x=data$DateTime,y=data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
##adding first line
lines(data$DateTime,data$Sub_metering_1)
##adding second line
lines(data$DateTime,data$Sub_metering_2,col="red")
##adding third line
lines(data$DateTime,data$Sub_metering_3,col="blue")
##adding legend
legend(lty=1,lwd=1,"topright",col=c("black","red","blue"),
legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))

}
quartz()
plot3()
dev.copy(png,"plot3.png")