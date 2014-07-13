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
#Represent plot 1
png("plot1.png",bg="white")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()