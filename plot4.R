##How to clean data into table format
##Step 1 read the file 
d <-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
##Step 2 subsetting
data<-d[(d$Date=="1/2/2007" | d$Date=="2/2/2007" ),]
## change time-date format
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

##create plot2
plot2<-function(){
 with(data,plot(type ="l",y=Global_active_power,x=DateTime,xlab="",ylab="Global Active Power(Kilowatts)"))
 }

##create plot3
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

##plot4
quartz()
par(mfcol=c(2,2))
plot2()
plot3()
plot(x=data$DateTime,y=data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(x=data$DateTime,y=data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_active_power")
dev.copy(png,"plot4.png")

