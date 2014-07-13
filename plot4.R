#Load data
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
#Transform Date variable
data$Date=as.Date(data$Date,format="%d/%m/%Y")
#Extract observations 
data=subset(data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
#Transform variables 
datetime<-paste(as.character(data$Date),as.character(data$Time),sep=" ")
time<-strptime(datetime,format="%Y-%m-%d %H:%M")
data$Time=time
for (i in 3:9)
{
data[,i]=as.numeric(as.character(data[,i]))
}
#Represent plot 4
png("plot4.png",bg="white")
par(mfrow=c(2,2))
plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
plot(data$Time,data$Voltage,ylab="Voltage",type="l",xlab="datetime")
plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(data$Time,data$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(data$Time,data$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(data$Time,data$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")
dev.off()