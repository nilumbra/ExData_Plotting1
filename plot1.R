##Step 1 read the file 
d <-read.table(file="household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
##Step 2 subsetting
data<-d[(d$Date=="1/2/2007" | d$Date=="2/2/2007" ),]
## change time-date format
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

##plot1
quartz()
 with(data,hist(x=Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power(kilowatts)"))
 dev.copy(png,file="plot1.png")
