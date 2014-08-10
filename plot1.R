#download data
Data<-read.table('household_power_consumption.txt', 
                 header=TRUE,
                 sep=';',colClasses="character")

#extract 1st and 2nd February
Data<-Data[Data$Date=='2/2/2007'| Data$Date=='1/2/2007',]

#change data format
Data$DateTime <- paste(Data$Date,Data$Time)
Data$DateTime<-strptime(Data$DateTime, "%d/%m/%Y %H:%M:%S")

#change classes of variables
Data$Global_reactive_power<-as.numeric(Data$Global_reactive_power)
Data$Global_active_power<-as.numeric(Data$Global_active_power)
Data$Sub_metering_1<-as.numeric(Data$Sub_metering_1)
Data$Sub_metering_2<-as.numeric(Data$Sub_metering_2)
Data$Sub_metering_3<-as.numeric(Data$Sub_metering_3)
Data$Voltage<-as.numeric(Data$Voltage)

#plot1
png(file='plot1.png',width = 480, height = 480, units = "px")
hist(Data$Global_active_power, breaks=12, 
     col='red',main='Global Active Power', 
     xlab='Global Active Power (kilowatts)')
dev.off()