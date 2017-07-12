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

## Plot 1
png(filename="plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()