##Step 1 read the file 
d <-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")

##Step 2 subsetting
data<-d[(d$Date=="1/2/2007" | d$Date=="2/2/2007" ),]
## change time-date format
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

##plot2
plot2<-function(){
 with(data,plot(type ="l",y=Global_active_power,x=DateTime,xlab="",ylab="Global Active Power(Kilowatts)"))
 }
 quartz()
 plot2()
 dev.copy(png,"plot1.png")
