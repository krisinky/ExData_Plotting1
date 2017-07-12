##read subset of data
initial <- read.table("household_power_consumption.txt", nrows = 100,sep=";",
                      skip=1)
classes <- sapply(initial, class)
data<-subset(read.table(file="household_power_consumption.txt",sep=";",
       colClasses=classes,skip=1,na.strings="?"),V1=="1/2/2007"|V1=="2/2/2007")
##add column names
getnames<-initial <- read.table("household_power_consumption.txt", 
                                nrows = 100,sep=";",header=TRUE)
cnames<-names(getnames)
colnames(data)<-cnames

## format datetimes
data$dt1<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data$wday<-weekdays(data$dt1)


## Plot 4
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

## topleft
with(data,plot(dt1,Global_active_power,type="l", 
               ylab="Global Active Power (kilowatts)",xlab="",mar=c(5,4,4,2)))
##top right
with(data,plot(dt1,Voltage,type="l", 
               ylab="Voltage",xlab="datetime",mar=c(5,4,4,2)))

###bottom left
Time<-data$dt1
sub2<-data$Sub_metering_2
sub3<-data$Sub_metering_3
plot(Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",
     xlab="",mar=c(5,4,4,2),col="black")
lines(Time,sub2,col="red")
lines(Time,sub3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1,bty="n")

## bottom right
with(data,plot(dt1,Global_reactive_power,type="l", 
               ylab="Global_reactive_power",xlab="datetime",mar=c(5,4,4,2)))
dev.off()