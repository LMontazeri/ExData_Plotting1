#reading the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "exdata_data_houshold_power_consumption.zip")
unzip("exdata_data_houshold_power_consumption.zip")
data <- read.table(file="household_power_consumption.txt", sep = ";", header = TRUE)
#formating the file
subdata <- subset(data, data$Date=="1/2/2007"| data$Date=="2/2/2007")
TimeDate <- strptime(paste(subdata$Date,subdata$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
subplusdata <- cbind(subdata, TimeDate)
subplusdata$Sub_metering_1<-as.numeric(subplusdata$Sub_metering_1)
subplusdata$Sub_metering_2<-as.numeric(subplusdata$Sub_metering_2)
subplusdata$Sub_metering_3<-as.numeric(subplusdata$Sub_metering_3)
subplusdata$Global_reactive_power <- as.numeric(subplusdata$Global_reactive_power)
subplusdata$Global_active_power <- as.numeric(subplusdata$Global_active_power)
subplusdata$Voltage<- as.numeric(subplusdata$Voltage)
subplusdata$Global_intensity<-as.numeric(subplusdata$Global_intensity)
#plot4 
png("plot4.png", width = 450, height= 450 )
par(mfrow=c(2,2))
#1
with(subplusdata,plot(TimeDate,Global_active_power, type="l", xlab="", ylab="Global Active Power"))
#2
with(subplusdata,plot(TimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
#3
with(subplusdata,plot(TimeDate, Sub_metering_1, col= "black", type="l", xlab="Day", ylab="Energy sub metering" ))
lines(subplusdata$TimeDate, subplusdata$Sub_metering_2, col = "red")
lines(subplusdata$TimeDate, subplusdata$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black","red","blue"))
#4
with(subplusdata,plot(TimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()

