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
#Represent plot 3
png("plot3.png",bg="white")
plot(data$Time,data$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
plot.xy(xy.coords(data$Time,data$Sub_metering_2),type="l",col="red")
plot.xy(xy.coords(data$Time,data$Sub_metering_3),type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()