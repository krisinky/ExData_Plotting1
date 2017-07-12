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


## Plot 2
png(filename="plot2.png",width=480,height=480)
with(data,plot(dt1,Global_active_power,type="l",
               ylab="Global Active Power (kilowatts)",xlab="",mar=c(5,4,4,2)))


dev.off()