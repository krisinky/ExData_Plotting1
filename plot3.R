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


## Plot 3
png(filename="plot3.png",width=480,height=480)
Time<-data$dt1
sub2<-data$Sub_metering_2
sub3<-data$Sub_metering_3
plot(Time,data$Sub_metering_1,type="l",ylab="Energy sub metering",
     xlab="",mar=c(5,4,4,2),col="black")
lines(Time,sub2,col="red")
lines(Time,sub3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1)

dev.off()